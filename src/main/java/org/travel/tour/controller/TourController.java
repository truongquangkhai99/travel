package org.travel.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.travel.base.Message;
import org.travel.common.Common;
import org.travel.common.Constant;
import org.travel.tour.bean.TourBean;
import org.travel.tour.bo.TourBO;
import org.travel.tour.form.TourForm;
import org.travel.tour.service.TourService;

@Controller
@RequestMapping("/admin/v2")
public class TourController {
	@Autowired
	private TourService tourService;

	@RequestMapping(value = "/tour", method = RequestMethod.GET)
	public String getHomePage(Model model, HttpServletRequest req) {
		TourForm tourForm = new TourForm();
		tourForm.setPage(1L);
		tourForm.setMaxPageItem(10L);
		tourForm.setSortName("createDate");
		tourForm.setSortBy("DESC");
		req.setAttribute("page", tourForm.getPage());
		int totalPages = (int)Math.ceil((double) tourService.getCount()/tourForm.getMaxPageItem());
		req.setAttribute("totalPages", totalPages);
		List<TourBean> tours = tourService.search(tourForm);
		model.addAttribute(tourForm);
		model.addAttribute("tours",tours);
		return "tourPage";
	}
	@RequestMapping(value = "/tour", method = RequestMethod.POST)
	@ResponseBody
	public Message saveTour(@RequestBody TourForm tourForm, HttpServletRequest req, HttpServletResponse resp) {
		tourService.saveOrUpdate(tourForm);
		return Common.createMessage("thêm mới tour thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}
	@RequestMapping(value = "/tour/list", method = RequestMethod.POST)
	public String getList(@RequestBody TourForm tourForm, HttpServletRequest req) {
		List<TourBean> tours = tourService.search(tourForm);
		req.setAttribute("tours", tours);
		req.setAttribute("page", tourForm.getPage());
		int totalPages = (int)Math.ceil((double) tourService.getCount()/tourForm.getMaxPageItem());
		req.setAttribute("totalPages", totalPages);
		return "listTour";
	}
	@RequestMapping(value = "/tour/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteUser(@PathVariable("id") Long id, HttpServletRequest req, HttpServletResponse resp) {
		TourBO tourBO = tourService.findByid(id).orElse(new TourBO());
		if(Common.isNullOrEmpty(tourBO)) {
			return Common.createMessage("Tour không tồn tại trong hệ thống", Constant.Message.Error, HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}else {
			tourService.deleteTour(tourBO);
		}
		return Common.createMessage("Xóa thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}
	
	@RequestMapping(value = "/tour/lock/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message getList(@PathVariable("id") Long id, HttpServletRequest req, HttpServletResponse resp) {
		TourBO tourBO = tourService.findByid(id).orElse(new TourBO());
		if(Common.isNullOrEmpty(tourBO)) {
			return Common.createMessage("Tour không tồn tại trong hệ thống", Constant.Message.Error, HttpServletResponse.SC_MULTIPLE_CHOICES, resp);
		}else {
			if(tourBO.getStatus()==1L|| Common.isNullOrEmpty(tourBO.getStatus())) {
				tourBO.setStatus(0L);
			} else {
				tourBO.setStatus(1L);
			}
			tourService.saveOrUpdate(tourBO);
		}
		return Common.createMessage("Khóa thành công", Constant.Message.Success, HttpServletResponse.SC_OK, resp);
	}
	@RequestMapping(value = "/tour/{id}", method = RequestMethod.POST)
	public String getSavePage(@PathVariable("id") Long id, HttpServletRequest req, Model model) {
		TourForm tourFormSave = new TourForm();
		tourFormSave.setPage(1L);
		tourFormSave.setMaxPageItem(10L);
		tourFormSave.setSortName("createDate");
		tourFormSave.setSortBy("DESC");
		req.setAttribute("page", tourFormSave.getPage());
		int totalPages = (int)Math.ceil((double) tourService.getCount()/tourFormSave.getMaxPageItem());
		req.setAttribute("totalPages", totalPages);
		model.addAttribute("tourFormSave", tourFormSave);
		return "saveTour";
	}
}
