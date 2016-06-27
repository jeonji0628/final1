package com.KHbiz.resources;

import org.springframework.ui.Model;

public interface ResourcesService {

	public void allselect(Model model);
	public void bookresource(StatusDTO statusDTO, Model model);
	public void booklist(int code, Model model);
}
