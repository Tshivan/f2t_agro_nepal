package com.siristim.agro_ecom.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.siristim.agro_ecom.entity.Cart;
import com.siristim.agro_ecom.entity.UserDetail;

public interface CartDao extends JpaRepository<Cart, Integer>{
	

		public List<Cart> findByUserDetail(UserDetail userDetail);

		public void deleteByUserDetail(UserDetail userDetail);
}
