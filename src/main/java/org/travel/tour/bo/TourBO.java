package org.travel.tour.bo;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.travel.base.BaseBO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity( name = "tour")
@EqualsAndHashCode(callSuper = true)
@Data
@Table(name = "tour")
public class TourBO extends BaseBO {
	
	@Column(name = "code")
	private String code;

	@Column(name = "status")
	private Long status;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "small_img")
	private String smallImg;
	
	@Column(name = "content_img")
	private String contentImg;
	
	@Column(name = "price")
	private Long price;
	
	@Column(name = "start_date")
	private Date startDate;
	
	@Column(name = "number_of_seats")
	private Long numberOfSeats;
	
	@Column(name = "departure_location")
	private String departureLocation;
	
	@Column(name = "tour_program")
	private String tourProgram;
	
	@Column(name = "time_of_depature")
	private Date timeOfDepature;
	
	@Column(name = "time_of_end")
	private Date timeOfEnd;
	
	@Column(name = "flight_number_of_depature")
	private String flightNumberOfDepature;
	
	@Column(name = "flight_number_return")
	private String flightNumberReturn;
	
	@Column(name = "hotel_information")
	private String  hotelInformation;
	
	@Column(name = "userId")
	private Long userId;
	
	@Column(name = "date_of_gathering")
	private Date dateOfGathering;
	
	@Column(name = "gathering_place")
	private String gatheringPlace;
	
	@Column(name = "date_time_gathering")
	private Date dateTimeGathering;
	
	@Column(name = "price_child")
	private Long priceChild;
	
	@Column(name = "price_baby")
	private Long priceBaby;
	
	@Column(name = "surcharge")
	private Long  surcharge;
	
	@Column(name = "note")
	private String note;
	
	@Column(name = "license_plates")
	private String  licensePlates;
	
	@ManyToMany
    @JoinTable(name = "detail_tour_service",
        joinColumns = @JoinColumn(name = "id_tour"),
        inverseJoinColumns = @JoinColumn(name = "id_service"))
    private Collection<ServicesBO> services;
	
	@ManyToMany
    @JoinTable(name = "detail_tour_location",
        joinColumns = @JoinColumn(name = "id_tour"),
        inverseJoinColumns = @JoinColumn(name = "id_location"))
    private Collection<LocationBO> locations;
}
