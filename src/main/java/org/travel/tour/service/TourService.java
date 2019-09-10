package org.travel.tour.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.travel.tour.bean.TourBean;
import org.travel.tour.bo.TourBO;
import org.travel.tour.dao.TourDAO;
import org.travel.tour.form.TourForm;

@Service
public class TourService {
	
	@Autowired
	private TourDAO tourDAO;
	@Autowired
	private EntityManager entityManager;
	
	public Optional<TourBO> findByid(Long id){
		return tourDAO.findById(id);
	}
	public void deleteTour(TourBO tourBO) {
		tourDAO.delete(tourBO);
	}
	public void saveOrUpdate(TourBO tourBO) {
		tourDAO.save(tourBO);
	}
	public List<TourBean> search(TourForm tourForm){
		return tourDAO.search(tourForm, entityManager);
	}
	public Long getCount() {
		return tourDAO.count();
	}
}
