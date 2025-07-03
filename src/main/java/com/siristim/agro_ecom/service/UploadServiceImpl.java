package com.siristim.agro_ecom.service;

import java.io.File;
import java.io.IOException;

import com.siristim.agro_ecom.controller.CategoryController;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadServiceImpl implements UploadService{

    private final CategoryController categoryController;

    UploadServiceImpl(CategoryController categoryController) {
        this.categoryController = categoryController;
    }

	@Override
	public boolean uploadProductImage(MultipartFile image) {
		File uploadDir = new File(UPLOAD_DIR+File.separator+"product_image");
		if(!uploadDir.exists())
				uploadDir.mkdirs();
		
		File uploadFile = new File(UPLOAD_DIR+"//product_image//"+ image.getOriginalFilename());
		try {
			image.transferTo(uploadFile);
			return true;
		} catch (IllegalStateException | IOException e) {
			System.out.println("Image Upload Failed!");
		}
		return false;
	}

}
