package com.indiapost;

import java.util.ArrayList;
import java.util.List;

//import java.util.*;

public class UserDataStore {

	private static UserDataStore instance;
	private static List<UserDetails> userDetailsList = new ArrayList<UserDetails>();
	private static int userId = 0;

	private UserDataStore() {

	}

	public static UserDataStore getInstance() {
		if (instance == null) {
			instance = new UserDataStore();
		}
		return instance;
	}

	public List<UserDetails> getUserDetailsList() {
		return userDetailsList;
	}

	public static int addUserDetail(UserDetails userDetails) {
		if (instance == null) {
			instance = new UserDataStore();
		}
		
		userId += 1;

		userDetails.setUserId(userId);

		userDetailsList.add(userDetails);
		return userDetails.getUserId();
	}
}
