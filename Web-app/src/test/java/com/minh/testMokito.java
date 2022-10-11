package com.minh;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import com.minh.dao.CategoryDAO;
import com.minh.entity.Category;
import com.minh.entity.Product;
import com.minh.service.Impl.ProductServiceImpl;

@RunWith(MockitoJUnitRunner.class)
public class testMokito {
	@InjectMocks
	private ProductServiceImpl productService;
	
	@Mock
	private CategoryDAO categoryDao;
	
	@Test
	public void test_findAll_success() {
		
		List<Category> expected = new ArrayList<Category>();
		expected.add(new Category(1, "name", new ArrayList<Product>()));
		
		when(categoryDao.AllLoai()).thenReturn(expected);
		
		List<Category> actual = new ArrayList<Category>();
		productService.listCate();
		try {
			actual = productService.listCate();
			assertEquals(1, actual.size());
		}catch(Exception e) {
			fail("Should not fail exception");
		}
	}
}
