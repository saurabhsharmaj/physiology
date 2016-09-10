package com.phyapp.web.exception;

@SuppressWarnings("serial")
public class PhysiologyException extends Exception {

	public PhysiologyException(String msg, Exception ex) {
		super(msg, ex);
	}

}
