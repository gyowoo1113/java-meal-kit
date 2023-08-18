package co.yedam.mealkit.review.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int reviewId;
	private LocalDate reviewDate;
	private String reviewImg;
	private String reviewTitle;
	private String reviewSubject;
	private int reviewHit;
	private String memberId;
	private int productId;
	
}
