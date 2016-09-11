package com.phyapp.config;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.phyapp.web.modal.Login;
import com.phyapp.web.service.LoginService;
import com.phyapp.web.service.UserService;
 
@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
 
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
 
    @Autowired
   LoginService loginService;
    
    @Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        String targetUrl = determineTargetUrl(authentication);
 
        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }
        String username =  ((org.springframework.security.core.userdetails.User)authentication.getPrincipal()).getUsername();
        Login login = loginService.getLoginDetailByUserName(username);
        request.getSession().setAttribute("loginDetails",login);
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
 
    /*
     * This method extracts the roles of currently logged-in user and returns
     * appropriate URL according to his/her role.
     */
    protected String determineTargetUrl(Authentication authentication) {
        String url = "";
 
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
 
        List<String> roles = new ArrayList<String>();
 
        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }
 
        if (isAdmin(roles)) {
            url = "/admin";
        }  else if (isDoctor(roles)) {
            url = "/doctorHome";
        } else if (isPatient(roles)) {
            url = "/patientHome";
        } else {
            url = "/accessDenied";
        }
 
        return url;
    }
 
    private boolean isDoctor(List<String> roles) {
        if (roles.contains("ROLE_DOCTOR")) {
            return true;
        }
        return false;
    }
 
    private boolean isAdmin(List<String> roles) {
        if (roles.contains("ROLE_ADMIN")) {
            return true;
        }
        return false;
    }
 
    private boolean isPatient(List<String> roles) {
        if (roles.contains("ROLE_PATIENT")) {
            return true;
        }
        return false;
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
 
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
 
}