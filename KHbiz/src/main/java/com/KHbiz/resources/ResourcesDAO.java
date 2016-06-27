package com.KHbiz.resources;

import java.util.List;

public interface ResourcesDAO {
	public List<ResourcesDTO> allselect() throws Exception;
	public void bookresource(StatusDTO statusDTO) throws Exception;
	public List<StatusDTO> booklist(int code) throws Exception;
}
