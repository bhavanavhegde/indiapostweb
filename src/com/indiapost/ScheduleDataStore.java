package com.indiapost;

import java.util.ArrayList;
import java.util.List;



public class ScheduleDataStore {

	private static ScheduleDataStore instance;
	private static List<ScheduleUserDetails> scheduleDetailsList = new ArrayList<ScheduleUserDetails>();
	private static int scheduleId = 0;

	private ScheduleDataStore()

	{

	}

	public static ScheduleDataStore getInstance() {
		if (instance == null) {
			instance = new ScheduleDataStore();
		}
		return instance;

	}

	public static int addScheduleDetail(ScheduleUserDetails scheduleUserDetails) {
		if (instance == null) {
			instance = new ScheduleDataStore();
		}

		scheduleId += 1;
		scheduleUserDetails.setScheduleId(scheduleId);

		scheduleDetailsList.add(scheduleUserDetails);
		return scheduleUserDetails.getScheduleId();

	}

	public static List<ScheduleUserDetails> getScheduleDetailsOfUser(int userId) {
		List<ScheduleUserDetails> userScheduleDetailList = new ArrayList<ScheduleUserDetails>();
		for (ScheduleUserDetails scheduleUserDetails : scheduleDetailsList) {
			if (userId == scheduleUserDetails.getUserId()) {

				userScheduleDetailList.add(scheduleUserDetails);

			}
	

		}
		return userScheduleDetailList;

	}

}
