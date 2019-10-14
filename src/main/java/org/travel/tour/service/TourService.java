package org.travel.tour.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.travel.common.Common;
import org.travel.config.security.EncrytedPasswordUtils;
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
	public void saveOrUpdate(TourForm tourForm) {
		TourBO tourBO  = new TourBO();
		tourBO.setCode(tourForm.getCode());
		tourBO.setCreateBy(EncrytedPasswordUtils.getUserName());
		tourBO.setCreateDate(new Date());
		tourBO.setStatus(tourForm.getStatus());
		tourBO.setTitle(tourForm.getTitle());
		tourBO.setSmallImg(tourForm.getSmallImg());
		tourBO.setContentImg(tourForm.getContentImg());
		tourBO.setPrice(tourForm.getPrice());
		tourBO.setStartDate(Common.convertStringToDate(tourForm.getStartDate()));
		tourBO.setNumberOfSeats(tourForm.getNumberOfSeats());
		tourBO.setDepartureLocation(tourForm.getDepartureLocation());
		tourBO.setTourProgram(tourForm.getTourProgram());
		tourBO.setTimeOfDepature(Common.convertStringToDate(tourForm.getTimeOfDepature()));
		tourBO.setTimeOfEnd(Common.convertStringToDate(tourForm.getTimeOfEnd()));
		tourBO.setFlightNumberOfDepature(tourForm.getFlightNumberOfDepature());
		tourBO.setFlightNumberReturn(tourForm.getFlightNumberReturn());
		tourBO.setHotelInformation(tourForm.getHotelInformation());
		tourBO.setUserId(tourForm.getUserId());
		tourBO.setDateOfGathering(Common.convertStringToDate(tourForm.getDateOfGathering()));
		tourBO.setGatheringPlace(tourForm.getGatheringPlace());
		tourBO.setDateTimeGathering(Common.convertStringToDate(tourForm.getDateTimeGathering()));
		tourBO.setPriceChild(tourForm.getPriceChild());
		tourBO.setPriceBaby(tourForm.getPriceBaby());
		tourBO.setSurcharge(tourForm.getSurcharge());
		tourBO.setNote(tourForm.getNote());
		tourBO.setLicensePlates(tourForm.getLicensePlates());
		tourDAO.save(tourBO);
		
	}
}
