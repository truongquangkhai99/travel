package org.travel.tour.form;

import lombok.Data;

@Data
public class TourForm {
	
	private Long id;

	private String createDate;

	private String modifyDate;

	private String createBy;

	private String modifyBy;

	private String code;

	private Long status;
	
	private String title;
	
	private String smallImg;
	
	private String contentImg;
	
	private Long price;
	
	private String startDate;
	
	private Long numberOfSeats;
	
	private String departureLocation;
	
	private String tourProgram;
	
	private String timeOfDepature;
	
	private String timeOfEnd;
	
	private String flightNumberOfDepature;
	
	private String flightNumberReturn;
	
	private String  hotelInformation;
	
	private Long userId;
	
	private String dateOfGathering;
	
	private String gatheringPlace;
	
	private String dateTimeGathering;
	
	private Long priceChild;
	
	private Long priceBaby;
	
	private Long  surcharge;
	
	private String note;
	
	private String  licensePlates;
	
	private Long page;
	
	private Long maxPageItem;
	
	private String sortName;
	
	private String sortBy;
}
