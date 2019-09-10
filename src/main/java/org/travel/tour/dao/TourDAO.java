package org.travel.tour.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.transform.Transformers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.travel.base.vfdata.impl.VfData;
import org.travel.common.Common;
import org.travel.tour.bean.TourBean;
import org.travel.tour.bo.TourBO;
import org.travel.tour.form.TourForm;
import org.travel.user.bean.UserBean;
import org.travel.user.form.UserForm;

@Repository
public interface TourDAO extends JpaRepository<TourBO, Long> {
	

	public default List<TourBean> search(TourForm tourForm, EntityManager entityManager){
		Map<String,Object> params = new HashMap<String, Object>();
		VfData vfData = new VfData();
		String sql = " SELECT "
				   + " t.id AS id,"
				   + " t.createDate AS createDate,"
				   + " t.modifyDate AS modifyDate,"
				   + " t.createBy AS createBy,"
				   + " t.modifyBy AS modifyBy,"
				   + " t.code AS code,"
				   + " t.status AS status,"
				   + " t.title AS title,"
				   + " t.price AS price,"
				   + " t.startDate AS startDate,"
				   + " t.numberOfSeats AS numberOfSeats,"
				   + " t.departureLocation AS departureLocation,"
				   + " t.tourProgram AS tourProgram,"
				   + " t.timeOfDepature AS timeOfDepature,"
				   + " t.timeOfEnd AS timeOfEnd,"
				   + " t.flightNumberOfDepature AS flightNumberOfDepature,"
				   + " t.flightNumberReturn AS flightNumberReturn,"
				   + " t.hotelInformation AS hotelInformation,"
				   + " t.userId AS userId,"
				   + " t.dateOfGathering AS dateOfGathering,"
				   + " t.gatheringPlace AS gatheringPlace,"
				   + " t.dateTimeGathering AS dateTimeGathering,"
				   + " t.priceChild AS priceChild,"
				   + " t.priceBaby AS priceBaby,"
				   + " t.surcharge AS surcharge,"
				   + " t.note AS note,"
				   + " t.licensePlates AS licensePlates"
				   + " FROM tour AS t"
				   + " WHERE 1 = 1 ";
		sql =vfData.getQuery(sql, " AND t.code = :code", "code", tourForm.getCode(), params);
		sql =vfData.getQuery(sql, " AND t.status = :status", "status", tourForm.getStatus(), params);
		sql =vfData.getQuery(sql, " AND t.title = :title", "title", tourForm.getTitle(), params);
		sql =vfData.getQuery(sql, " AND t.price = :price", "price", tourForm.getPrice(), params);
		sql =vfData.getQuery(sql, " AND t.startDate = :startDate", "startDate", Common.convertStringToDate(tourForm.getStartDate()), params);
		sql =vfData.getQuery(sql, " AND t.numberOfSeats = :numberOfSeats", "numberOfSeats", tourForm.getNumberOfSeats(), params);
		sql =vfData.getQuery(sql, " AND t.departureLocation = :departureLocation", "departureLocation", tourForm.getDepartureLocation(), params);
		sql =vfData.getQuery(sql, " AND t.hotelInformation = :hotelInformation", "hotelInformation", tourForm.getHotelInformation(), params);
		sql =vfData.getQuery(sql, " AND t.userId = :userId", "userId", tourForm.getUserId(), params);
		
		sql+= " ORDER BY "+ tourForm.getSortName()+" "+ tourForm.getSortBy();
		Query query = (Query) entityManager.createQuery(sql);
		vfData.setParameter(query, params);
		query.setFirstResult((int) ((tourForm.getPage()-1)*tourForm.getMaxPageItem()));
		query.setMaxResults(tourForm.getMaxPageItem().intValue());
		List<TourBean> list = (List<TourBean>) query.unwrap( org.hibernate.query.Query.class )
				.setResultTransformer( Transformers.aliasToBean( TourBean.class ) )
				.getResultList();
		return list;
		}
}
