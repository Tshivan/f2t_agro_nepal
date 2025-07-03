package com.siristim.agro_ecom.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
	
	public static final String UPLOAD_DIR = "c://users//asus//desktop//agro_eccommerce7";
	
	
	public boolean uploadProductImage(MultipartFile image);
	
	

}
