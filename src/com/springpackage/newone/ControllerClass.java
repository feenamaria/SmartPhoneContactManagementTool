package com.springpackage.newone;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerClass {

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/add.html", method = RequestMethod.POST)
	public ModelAndView setContactDetails(HttpServletResponse resp,
			@RequestParam("name") String name,
			@RequestParam("lname") String lname,
			@RequestParam("phoneNumber") List<String> phoneNumber,
			@RequestParam("phoneType") List<String> phoneType,
			@RequestParam("emailId") List<String> emailId,
			@RequestParam("emailType") List<String> emailType,
			@RequestParam("address") List<String> address,
			@RequestParam("addressType") List<String> addressType,
			@RequestParam("groups") List<String> groups,
			@RequestParam("messagealert") String messagealert,
			@RequestParam("rt") String rt, @RequestParam("vp") String vp,
			@RequestParam("isFavourite") String isFavourite) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String newlname= null;
		if(!lname.isEmpty())
		{
			lname=newlname;
		}

		List<String> newphoneNumber = new ArrayList<>();
		List<String> newphoneType = new ArrayList<>();
		for (int i = 0; i < phoneNumber.size(); i++) {
			if (!phoneNumber.get(i).isEmpty()) {
				newphoneNumber.add(phoneNumber.get(i));
				newphoneType.add(phoneType.get(i));
			}
		}
		List<String> newemailId = new ArrayList<>();
		List<String> newemailType = new ArrayList<>();
		for (int i = 0; i < emailId.size(); i++) {
			if (!emailId.get(i).isEmpty()) {
				newemailId.add(emailId.get(i));
				newemailType.add(emailType.get(i));
			}
		}
		List<String> newaddress = new ArrayList<>();
		List<String> newaddressType = new ArrayList<>();
		for (int i = 0; i < address.size(); i++) {
			if (!address.get(i).isEmpty()) {
				newaddress.add(address.get(i));
				newaddressType.add(addressType.get(i));
			}
		}
		ContactDetails sd = new ContactDetails(name, lname, newphoneNumber,
				phoneType, newemailId, emailType, newaddress, addressType,
				groups, messagealert, rt, vp, isFavourite);
		for (String grp : groups) {
			Query q = pm.newQuery(Groups.class);
			q.setFilter("groupName==grp");
			q.declareParameters("String grp");
			List<Groups> results = (List<Groups>) q.execute(grp);
			Groups searchedresults = null;
			if (!results.isEmpty()) {
				searchedresults = results.get(0);
				if (!searchedresults.memberNames.contains(name)) {
					searchedresults.memberNames.add(name);
					pm.makePersistent(searchedresults);
				}
			} else {
				List<String> memberList = new ArrayList<>();
				memberList.add(name);
				Groups gp = new Groups(grp, memberList, null, null);
				pm.makePersistent(gp);
			}
		}
		try {
			pm.makePersistent(sd);
		} finally {
			pm.close();
		}
		List<ContactDetails> results = new ArrayList<ContactDetails>();
		results.add(sd);
		ModelAndView modelandview = new ModelAndView("searchview");
		modelandview.addObject("contacts", results );
		return modelandview;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/add1.html", method = RequestMethod.POST)
	public ModelAndView setGroupDetails(HttpServletResponse resp,
			@RequestParam("name") String name,
			@RequestParam("members") List<String> members,
			@RequestParam("wp") String wp, @RequestParam("rt") String rt)
			throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Groups obj = new Groups(name, members, wp, rt);

		Query q = pm.newQuery(ContactDetails.class);
		q.setFilter("firstName==conName");
		q.declareParameters("String conName");
		for (String conName : members) {
			List<ContactDetails> results = (List<ContactDetails>) q
					.execute(conName);
			ContactDetails con = results.get(0);
			if (!con.groups.contains(name)) {
				con.groups.add(name);
			}
			con.ringTone = rt;
			pm.makePersistent(con);
		}
		try {
			pm.makePersistent(obj);
		} finally {
			pm.close();
		}
		ModelAndView modelandview = new ModelAndView("groupcreated");
		return modelandview;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/editcontact.html", method = RequestMethod.POST)
	public ModelAndView editContact(HttpServletResponse resp,
			@RequestParam("name") String name) throws IOException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		q.setFilter("firstName==name");
		q.declareParameters("String name");
		List<ContactDetails> results = new ArrayList<>();
		try {
			results = (List<ContactDetails>) q.execute(name);
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("editcontactview");
		model.addObject("contact", results.get(0));
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search1.html", method = RequestMethod.POST)
	public ModelAndView setSearchDetails(HttpServletResponse resp,
			@RequestParam("name") String name) throws IOException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		q.setFilter("firstName==name");
		q.declareParameters("String name");
		List<ContactDetails> results = new ArrayList<>();
		try {
			results = (List<ContactDetails>) q.execute(name);
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("searchview");
		model.addObject("contacts", results);
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search2.html", method = RequestMethod.POST)
	public ModelAndView setSearch(HttpServletResponse resp,
			@RequestParam("name") String name) throws IOException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		q.setFilter("firstName==name");
		q.declareParameters("String name");
		List<ContactDetails> results = new ArrayList<>();
		try {
			results = (List<ContactDetails>) q.execute(name);
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("searchview");
		model.addObject("contacts", results);
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search3.html", method = RequestMethod.POST)
	public ModelAndView setSearchGroup(HttpServletResponse resp,
			@RequestParam("name") String name) throws IOException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(Groups.class);
		q.setFilter("groupName==name");
		q.declareParameters("String name");
		@SuppressWarnings("rawtypes")
		List<Groups> searchedresults = new ArrayList();
		try {
			searchedresults = (List<Groups>) q.execute(name);
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("searchviewgroup");
		model.addObject("groups", searchedresults);
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/delete1.html", method = RequestMethod.POST)
	public ModelAndView setContactDetails(HttpServletResponse resp,
			@RequestParam("name") String name) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(ContactDetails.class);
		q.setFilter("firstName == name");
		q.declareParameters("String name");

		Query q2 = pm.newQuery(Groups.class);
		q2.setFilter("groupName == gpname");
		q2.declareParameters("String gpname");

		List<ContactDetails> result = (List<ContactDetails>) q.execute(name);
		if (!result.isEmpty()) {
			q.deletePersistentAll(name);
			List<String> groups = result.get(0).groups;
			for (String grp : groups) {
				List<Groups> gp = (List<Groups>) q2.execute(grp);
				if (!gp.isEmpty()) {
					gp.get(0).memberNames.remove(name);
					if (gp.get(0).memberNames.size() > 0) {
						pm.makePersistent(gp.get(0));
					} else {
						q2.deletePersistentAll(grp);
					}

				}
			}
		}
		pm.close();
		ModelAndView modelandview = new ModelAndView("contactdeleted");
		return modelandview;
	}

	@RequestMapping(value = "/deletegroup1.html", method = RequestMethod.POST)
	public ModelAndView deleteGroups(HttpServletResponse resp,
			@RequestParam("groupname") List<String> groups) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Groups.class);
		q.setFilter("groupName == gpname");
		q.declareParameters("String gpname");

		Query q2 = pm.newQuery(ContactDetails.class);
		q2.setFilter("firstName == name");
		q2.declareParameters("String name");

		for (String grp : groups) {
			@SuppressWarnings("unchecked")
			List<Groups> result = (List<Groups>) q.execute(grp);
			if (!result.isEmpty()) {
				q.deletePersistentAll(grp);
				List<String> members = result.get(0).memberNames;
				for (String contact : members) {
					@SuppressWarnings("unchecked")
					List<ContactDetails> con = (List<ContactDetails>) q2
							.execute(contact);
					if (!con.isEmpty()) {
						con.get(0).groups.remove(grp);
						pm.makePersistent(con.get(0));
					}
				}
			}
		}
		pm.close();
		ModelAndView modelandview = new ModelAndView("groupdeleted");
		return modelandview;
	}

	@RequestMapping(value = "/deleteContacts.html", method = RequestMethod.POST)
	public ModelAndView deleteContacts(HttpServletResponse resp,
			@RequestParam("contact") List<String> contacts) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Groups.class);
		q.setFilter("groupName == gpname");
		q.declareParameters("String gpname");

		Query q2 = pm.newQuery(ContactDetails.class);
		q2.setFilter("firstName == name");
		q2.declareParameters("String name");

		for (String contact : contacts) {
			@SuppressWarnings("unchecked")
			List<ContactDetails> result = (List<ContactDetails>) q2
					.execute(contact);
			if (!result.isEmpty()) {
				q2.deletePersistentAll(contact);
				List<String> groups = result.get(0).groups;
				for (String grp : groups) {
					@SuppressWarnings("unchecked")
					List<Groups> gp = (List<Groups>) q.execute(grp);
					if (!gp.isEmpty()) {
						gp.get(0).memberNames.remove(contact);
						if (gp.get(0).memberNames.size() > 0) {
							pm.makePersistent(gp.get(0));
						} else {
							q.deletePersistentAll(grp);
						}

					}
				}
			}
		}
		pm.close();
		ModelAndView modelandview = new ModelAndView("contactsdeleted");
		return modelandview;
	}

	@RequestMapping(value = "/view.html", method = RequestMethod.GET)
	public ModelAndView viewContact() throws IndexOutOfBoundsException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		@SuppressWarnings("unchecked")
		List<ContactDetails> results = (List<ContactDetails>) q.execute();
		try {
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("view");
		model.addObject("contacts", results);
		return model;
	}

	@RequestMapping(value = "/viewgroup.html", method = RequestMethod.GET)
	public ModelAndView viewGroup() throws IndexOutOfBoundsException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(Groups.class);
		@SuppressWarnings("unchecked")
		List<Groups> results = (List<Groups>) q.execute();
		try {
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("viewgroup");
		model.addObject("groups", results);
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/favorites.html", method = RequestMethod.GET)
	public ModelAndView viewFavorites() throws IndexOutOfBoundsException {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		q.setFilter("isFavourite == trueValue");
		q.declareParameters("String trueValue");
		List<ContactDetails> results = new ArrayList<>();
		try {
			results = (List<ContactDetails>) q.execute("true");
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("favorites");
		model.addObject("contacts", results);
		return model;
	}

	@RequestMapping(value = "/add11.html", method = RequestMethod.GET)
	public ModelAndView getGroupsPage() {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		@SuppressWarnings("unchecked")
		List<ContactDetails> results = (List<ContactDetails>) q.execute();
		try {
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("groups");
		model.addObject("contacts", results);
		return model;
	}

	@RequestMapping(value = "/deletegroup.html", method = RequestMethod.GET)
	public ModelAndView getGroupsDeletePage() {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(Groups.class);
		@SuppressWarnings("unchecked")
		List<Groups> results = (List<Groups>) q.execute();
		try {
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView model = new ModelAndView("deletegroups");
		model.addObject("groups", results);
		return model;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/deletesinglegroup.html", method = RequestMethod.POST)
	public ModelAndView deleteGroup(HttpServletResponse resp,
			@RequestParam("name") String groupName) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(ContactDetails.class);
		q.setFilter("firstName == name");
		q.declareParameters("String name");

		Query q2 = pm.newQuery(Groups.class);
		q2.setFilter("groupName == gpname");
		q2.declareParameters("String gpname");

		List<Groups> result = (List<Groups>) q2.execute(groupName);
		if (!result.isEmpty()) {
			q2.deletePersistentAll(groupName);
			List<String> members = result.get(0).memberNames;
			for (String contact : members) {
				List<ContactDetails> con = (List<ContactDetails>) q
						.execute(contact);
				if (!con.isEmpty()) {
					con.get(0).groups.remove(groupName);
					pm.makePersistent(con.get(0));
				}
			}
		}
		pm.close();
		ModelAndView modelandview = new ModelAndView("group1deleted");
		return modelandview;
	}

	@RequestMapping(value = "/main.html", method = RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView model = new ModelAndView("main");
		return model;
	}

	@RequestMapping(value = "/addnew1.html", method = RequestMethod.GET)
	public ModelAndView getContact1Page() {
		ModelAndView modelview = new ModelAndView("addnew1");
		return modelview;
	}

	@RequestMapping(value = "/contactcreated.html", method = RequestMethod.GET)
	public ModelAndView getContactCreatedPage() {
		ModelAndView modelview = new ModelAndView("contactcreated");
		return modelview;
	}

	@RequestMapping(value = "/addnew2.html", method = RequestMethod.GET)
	public ModelAndView getGroupPage() {
		ModelAndView modelview = new ModelAndView("addnew2");
		return modelview;
	}

	@RequestMapping(value = "/head.html", method = RequestMethod.GET)
	public ModelAndView getHeadpage() {
		ModelAndView modelandview = new ModelAndView("heading");
		return modelandview;
	}

	@RequestMapping(value = "/tabs.html", method = RequestMethod.GET)
	public ModelAndView getTabspage() {
		ModelAndView modelandview = new ModelAndView("tabs");
		return modelandview;
	}

	@RequestMapping(value = "/deleteContactView.html", method = RequestMethod.GET)
	public ModelAndView getDeletePage() {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(ContactDetails.class);
		@SuppressWarnings("unchecked")
		List<ContactDetails> results = (List<ContactDetails>) q.execute();
		try {
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView modelview = new ModelAndView("deleteContactView");
		modelview.addObject("contacts", results);
		return modelview;
	}

	@RequestMapping(value = "/sheet.html", method = RequestMethod.GET)
	public ModelAndView getSheetpage() {
		ModelAndView modelandview = new ModelAndView("sheet");
		return modelandview;
	}

	@RequestMapping(value = "/contacts.html", method = RequestMethod.GET)
	public ModelAndView getContactPage1() {
		ModelAndView modelview = new ModelAndView("contacts");
		return modelview;
	}

	@RequestMapping(value = "/group.html", method = RequestMethod.GET)
	public ModelAndView getGroupPage1() {
		ModelAndView modelview = new ModelAndView("group");
		return modelview;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addnew.html", method = RequestMethod.GET)
	public ModelAndView getContactPage() {
		PersistenceManager pm1 = PMF.get().getPersistenceManager();
		Query q = pm1.newQuery(Groups.class);
		@SuppressWarnings("rawtypes")
		List<Groups> searchedresults = new ArrayList();
		try {
			searchedresults = (List<Groups>) q.execute();
		} finally {
			pm1.close();
			q.closeAll();
		}
		ModelAndView modelview = new ModelAndView("add");
		modelview.addObject("groups", searchedresults);
		return modelview;
	}
}