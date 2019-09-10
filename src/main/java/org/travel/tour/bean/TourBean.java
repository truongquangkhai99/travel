package org.travel.tour.bean;

import java.io.Serializable;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TourBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

	private Date createDate;

	private Date modifyDate;

	private String createBy;

	private String modifyBy;

	private String code;

	private Long status;
	
	private String title;
	
	private String smallImg;
	
	private String contentImg;
	
	private Long price;
	
	private Date startDate;
	
	private Long numberOfSeats;
	
	private String departureLocation;
	
	private String tourProgram;
	
	private Date timeOfDepature;
	
	private Date timeOfEnd;
	
	private String flightNumberOfDepature;
	
	private String flightNumberReturn;
	
	private String  hotelInformation;
	
	private Long userId;
	
	private Date dateOfGathering;
	
	private String gatheringPlace;
	
	private Date dateTimeGathering;
	
	private Long priceChild;
	
	private Long priceBaby;
	
	private Long  surcharge;
	
	private String note;
	
	private String  licensePlates;
	
}
