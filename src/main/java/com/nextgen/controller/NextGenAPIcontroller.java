package com.nextgen.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.nextgen.entities.Address;
import com.nextgen.entities.Invitation;
import com.nextgen.entities.Name;
import com.nextgen.entities.Organization;
import com.nextgen.entities.Person;
import com.nextgen.entities.Phone;
import com.nextgen.entities.Token;

@Controller
public class NextGenAPIcontroller {
private static final Logger logger = Logger.getLogger(NextGenAPIcontroller.class);

		private static ArrayList<String> APP = KeyKeeper.getAPP();
	
		/*
		 * These here functions activate when their corresponding URLs are submitted,
		 * and they return a JSP page.
		 */
		
		@RequestMapping(value="/angularJS.web",method = RequestMethod.GET)
		public String printWelcome(ModelMap model) {
		    return "AngularJSService";
		}
		
		@RequestMapping(value = "/angularServiceCallGet")
		public String angularServiceCallGet(ModelMap model) {
			
			model.addAttribute("message", "Spring MVC AngularJS Get");		
			return "AngularJSServiceGet";		
		}
		
		@RequestMapping(value = "/angularServiceCallPost")
		public String angularServiceCallPost(ModelMap model) {
			
			model.addAttribute("message", "Spring MVC AngularJS Post");		
			return "AngularJSServicePost";
		}
		
		@RequestMapping(value = "/ShowPersonView")
		public String ShowPersonView(ModelMap model) {
			
			model.addAttribute("message", "Listing members");		
			return "ShowPersonView";		
		}
		
		@RequestMapping(value = "/angularServiceCallFormPost")
		public String angularServiceCallFormPost(ModelMap model) {
			
			model.addAttribute("message", "Spring MVC AngularJS Form Post");		
			return "AngularJSServiceFormPost";		
		}
		
//		// The thing for creating a person by doing a POST
//		@RequestMapping(value = "/createPersonPost")
//		public String createPersonPost(ModelMap model) {
//			model.addAttribute("message", "Create Person Post");
//			return "CreatePersonView";
//		}
		
		// Load the CreatePersonViewVersionBeta JSP page
		@RequestMapping(value = "/createPersonViewVersionBeta", method = RequestMethod.GET)
		public ModelAndView createPersonPostVersionBeta(ModelMap model) {
			return new ModelAndView("/CreatePersonViewVersionBeta");
		}
		
		// Load the InvitePerson JSP page
		@RequestMapping(value = "/createInviteView", method = RequestMethod.GET)
		public ModelAndView createInvitePost(ModelMap model) {
			return new ModelAndView("/CreateInviteView");
		}
		
		
		@RequestMapping(value="/springAngularJS.web", 
		        method=RequestMethod.GET,
		        produces={"application/xml", "application/json"})
		public @ResponseBody Name getName() {      
		    Name name = new Name();
		    name.setGiven("Java");
		    name.setSurname("Honk");
		    return name;
		}
		
		@RequestMapping(value="/springAngularJS.personData", 
		        method=RequestMethod.GET,
		        produces={"application/xml", "application/json"})
		public @ResponseBody Person getPersonTest() {      
		    Person person = new Person();
		    Name name = new Name();
		    ArrayList<Address> addresses = new ArrayList<Address>();
		    Address address = new Address();
		    ArrayList<String> streets = new ArrayList<String>();
		    ArrayList<Phone> phones = new ArrayList<Phone>();
		    Phone phone = new Phone();
		    Organization organization = new Organization();
		    
		    /*filling up the object of person*/
		    person.setId("EKJ4UEA2");
		    person.setVersion(1426040880000L);
		    person.setCreation(1426040880000L);
		    person.setRealm("PLATFORM-COVS");
		    person.setStatus("active");
		    
		    name.setGiven("Johnny");
		    name.setSurname("The MurderFace");
		    
		    person.setName(name);
		    
		    streets.add("25800 Northwestern Hwy");
		    streets.add("31224 Evergreen Rd");
		    
		    address.setStreet(streets);
		    address.setCity("Southfield");
		    address.setState("MI");
		    address.setPostal("48076");
		    address.setCountry("US");
		    
		    addresses.add(address);
		    
		    person.setAddresses(addresses);
		    
		    person.setLanguage("EN");
		    person.setTimezone("EST5EDT");
		    
		    phone.setType("main");
		    phone.setNumber("123-123-1234");
		    phones.add(phone);
		    person.setPhones(phones);
		    
		    person.setEmail("junchang.gu@mailsac.covisintrnd.com");
		    
		    organization.setId("OPLATFORM-COVS150202");
		    organization.setType("organization");
		    organization.setRealm("PLATFORM-COVS");
		    person.setOrganization(organization);
		    return person;
		}
		
		@RequestMapping(value="/springAngularJS.tokenData", 
		        method=RequestMethod.GET,
		        produces={"application/xml", "application/json"})
		public @ResponseBody Token getToken() {      
		    Token token = new Token();
		    /*token.setCreator("15f23759-7ee0-419f-b281-023da47902f4");
		    token.setCreatorAppId("15f23759-7ee0-419f-b281-023da47902f4");
		    token.setCreation(1435065514072L);
		    token.setAccess_token( "TlRYVlh3K3RCWkF6SEtRK0tMWEFnOXVBUVhBVzV0dytDRTBlQjlNU25mbi9mQ3cwSndUWUVzTkdabXJ5ZnpEY3RKVVFYNm1zK21sS0x3NjJHZU9VeXBhVW9RcHlrVlJEdU9JVlVIVVduZG8yODBBcElnMlJud3IxdVUyZ3pYQ2xWUG9VVm50VWtCY09xTEoxcEJvVW5zUWxoWGdHeFVYZDRVUXFPU0Y4WU14QVVINUc4UWQvaExmZ1NTZFhuN2k5UlFMQjVvdFcwQXhMQm9uYmtiYmVpL21Bbmp2bFFuN0NXaHNST3R6L2VUWT0=");
		    token.setExpires_in("1800");
		    token.setToken_type("bearer");
		    token.setExpirationTime("1435067314072");
		    token.setIssueTime("1435065514072");*/		    
		    
		    RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.add("type", "client_credentials");
            headers.add("Accept", "application/vnd.com.covisint.platform.oauth.token.v1+json");
            headers.add("application-id", APP.get(0));
            headers.add("Authorization", "Basic " + APP.get(1) + "==");
            
            final HttpEntity<Token> wineRequest = new HttpEntity<Token>(token, headers);
            token = restTemplate.postForObject("https://api.covapp.io/oauth/v1/token", wineRequest,
                  Token.class);
            System.out.println("Token class: " + Token.class);
           /* headers.setAccept(Collections.singletonList(new MediaType(
                    PasswordSyncConstants.PASSWORD_ACCEPT_TYPE, PasswordSyncConstants.PASSWORD_ACCEPT_SUB_TYPE)));

            		HttpEntity<?> requestEntity = new HttpEntity<Object>(headers);

        			ResponseEntity<String> response = restTemplate.exchange(PasswordSyncUtil
                                    .buildPasswordExpiryServiceURI(globalCovUserId),HttpMethod.GET, requestEntity, String.class);*/
		    
		    return token;
		}

	
	@RequestMapping(value = "/firstPage")
	public String firstPage(ModelMap model) {
		
		logger.info("Log4j info is working");
        logger.warn("Log4j warn is working");       
        logger.debug("Log4j debug is working");
        logger.error("Log4j error is working");
        System.out.println("System out is working");
		model.addAttribute("message", "Spring MVC AngularJS RESTFul Service");
		
		return "index";		
	}
	
	
	
	@RequestMapping(value = "/angularServiceCallPost", method = RequestMethod.POST)
	public @ResponseBody List<Token> angularServiceCallPost(@RequestBody List<Token> person) {	
		
		return person;
	}
	
	
	
	@RequestMapping(value = "/angularServiceCallFormPost", method = RequestMethod.POST)
	public @ResponseBody List<Person> PostService(@RequestBody List<Person> person) {
		
		return person;
	}
	
	
//	@RequestMapping(value = "/createPersonPost", method = RequestMethod.POST)
//	public @ResponseBody List<Person> createPersonServicePost(@RequestBody List<Person> person) {
//		
//		return person;
//	}
	
 
	@RequestMapping(value = "/getSampleJSONData/{name}")
	public @ResponseBody String getSampleJSONData(@PathVariable String name) {		
 
		JSONObject jo = new JSONObject();
		jo.put("values", new JSONArray(new Long[][]{{1025409600000L,23L},{1028088000000L,19L},{1030766400000L,21L},{1033358400000L,22L}}));		
		jo.put("key", "North America");
		
		JSONArray ja = new JSONArray();
		
		for (int i = 0; i < 10; i++) {
			ja.put(jo);
		}
		
		return ja.toString();	
	}
	
	/*Actual method to fetch data*/
	public Token getAccessToken(){
		Token token = new Token();
		RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("type", "client_credentials");
        headers.add("Accept", "application/vnd.com.covisint.platform.oauth.token.v1+json");
        headers.add("application-id", APP.get(0));
        headers.add("Authorization", "Basic " + APP.get(1) + "==");
        System.out.println("Headers: " + headers);
        final HttpEntity<Token> wineRequest = new HttpEntity<Token>(token, headers);
        token = restTemplate.postForObject("https://api.covapp.io/oauth/v1/token", wineRequest, Token.class);
        
        return token;
	}
	
	public List<Person> getPersons(){
		List<Person> persons = new ArrayList<Person>();
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();	
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        //headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", accessToken);
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.v1+json");
        headers.add("Accept", "application/vnd.com.covisint.platform.person.v1+json");
        System.out.println("Get token headers: " + headers);
        String url;
    	url = "https://api.covapp.io/person/v1/persons";
		//url = "https://api.covapp.io/person/v1/persons?page=" + page + "&pageSize=" + pageSize;
    		
        HttpEntity<String> entity = new HttpEntity<String>(headers);		
        HttpEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        Gson gson = new Gson();
        Person[] personArray = gson.fromJson(response.getBody().toString(), Person[].class);
        persons = Arrays.asList(personArray);    
		return persons;
	}
	
	@RequestMapping(value="/personlist", 
	        method=RequestMethod.GET,
	        produces={"application/xml", "application/json"})
	public @ResponseBody List<Person> getPersonList() {      
		List<Person> persons = getPersons();		    
        
	    return persons;
	}	
	
	@RequestMapping(value = "/PersonDetailsView")
	public String PersonDetailsView(ModelMap model) {
		
		model.addAttribute("message", "Person detailed, no ID");		
		return "PersonDetailsView";		
	}
	
	
	@RequestMapping(value="/PersonDetailsView/{id}", 
	        method=RequestMethod.GET,
	        produces={"application/xml", "application/json"})
	public @ResponseBody ModelAndView getPersonDetailed(@PathVariable("id") String id, ModelMap model) {      
	    //ArrayList<Person> personList = new ArrayList<Person>();
		Person person = getPerson(id);
		//personList.add(person);
	    Gson gson = new Gson();
	    
	    String personJson = gson.toJson(person);
	    model.addAttribute(personJson);
	    return new ModelAndView("PersonDetailsView", "person", personJson);
	}
	
	

	public Person getPerson(String id) {      
		Person person = new Person();
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();	
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        //headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", accessToken);
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.v1+json");
        headers.add("Accept", "application/vnd.com.covisint.platform.person.v1+json");
        
        String url;
    	url = "https://api.covapp.io/person/v1/persons?id=" + id;
		//url = "https://api.covapp.io/person/v1/persons?page=" + page + "&pageSize=" + pageSize;
    		
        HttpEntity<String> entity = new HttpEntity<String>(headers);		
        HttpEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        Gson gson = new Gson();
        Person[] personArray = gson.fromJson(response.getBody().toString(), Person[].class);
        person = personArray[0];    
	    return person;
	}
	
	@RequestMapping(value="/person/{action}/{id}", 
	        method=RequestMethod.GET,
	        produces={"application/xml", "application/json"})
	public @ResponseBody ModelAndView personActions(@PathVariable("id") String id, @PathVariable("action") String action, ModelMap model) {      
		String actionMessage = "";
		//Actions include 'activate', 'suspend', 'unsuspend'
		System.out.println("Action: " + action);
			Person person = personDoActions(id, action);
			actionMessage = "Success";
			model.addAttribute(actionMessage);	   
	    return new ModelAndView("redirect:/ShowPersonView", "actionMessage", actionMessage);
	}
	
	public Person personDoActions(String id, String action) {      
		Person person = new Person();
		Token token = getAccessToken(); 
		RestTemplate restTemplate = new RestTemplate();
        String tokenType = token.getToken_type();	//Be careful with token type		
        
        //String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized		
		//String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        String accessToken =  "Bearer " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", accessToken);
        /*headers.add("type", "client_credentials");
        headers.add("Accept", "application/vnd.com.covisint.platform.oauth.token.v1+json");
        headers.add("application-id", APPID);*/
        System.out.println("Activate person headers: " + headers);
        String url = "https://api.covapp.io/person/v1/persons/tasks/" + action + "?personId=" + id;
        
        final HttpEntity<Person> wineRequest = new HttpEntity<Person>(person, headers);
        person = restTemplate.postForObject(url, wineRequest, Person.class);
        System.out.println(action + " person response: " + person);
	    return person;
	}	

	// POST Person attempt Version Beta
	@RequestMapping(value = "/createPersonPostVersionBeta", method = RequestMethod.POST)
	public @ResponseBody String savePerson_JSON(@RequestBody String person) {
//		List<Person> persons = new ArrayList<Person>();
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        //headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", accessToken);
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.v1+json");
        headers.add("Accept", "application/vnd.com.covisint.platform.person.v1+json");
        
        String url;
    	url = "https://api.covapp.io/person/v1/persons";
		//url = "https://api.covapp.io/person/v1/persons?page=" + page + "&pageSize=" + pageSize;
    	
        HttpEntity<String> entity = new HttpEntity<String>(person, headers);		
//        HttpEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        HttpEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
        
//        Gson gson = new Gson();
//        Person[] personArray = gson.fromJson(response.getBody().toString(), Person[].class);
//        persons = Arrays.asList(personArray);    
		return response.getBody().toString();
		
//		// Code processing the input parameters
//		return "JSON: The Person name: " + person.getName();
	}
	
	// PUT an update to a user. A POST is used to reach this method, which then uses a PUT to the APIs.
	@RequestMapping(value = "/updatePersonPut", method = RequestMethod.POST)
	public @ResponseBody String updatePerson_JSON(@RequestBody String person) {
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//getting token data
		String tokenType = token.getToken_type();
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.v1+json");
        headers.add("Authorization", accessToken);
        headers.add("Accept", "application/vnd.com.covisint.platform.person.v1+json");
        
        String url;
    	url = "https://api.covapp.io/person/v1/persons";
    	
        HttpEntity<String> entity = new HttpEntity<String>(person, headers);		
        /*HttpEntity<String> response = */restTemplate.put(url, entity, String.class);
          
		//return response.getBody().toString();
        return "A put was attempted.";
	}
	
	@RequestMapping(value = "/ShowInvitationList")
	public String ShowInvitationList(ModelMap model) {
		
		model.addAttribute("message", "Show invitations");		
		return "ShowInvitationList";		
	}
	
	@RequestMapping(value="/invitationlist", 
	        method=RequestMethod.GET,
	        produces={"application/xml", "application/json"})
	public @ResponseBody List<Invitation> getInvitationList() {      
		List<Invitation> invitations = getInvitations();		    
        
	    return invitations;
	}
	
	public List<Invitation> getInvitations(){
		List<Invitation> invitations = new ArrayList<Invitation>();
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();	
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized		
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        //headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", accessToken);
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        headers.add("Accept", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        System.out.println("Invitation token headers: " + headers);
        String url;
    	url = "https://api.covapp.io/person/v1/personInvitations";
		//url = "https://api.covapp.io/person/v1/persons?page=" + page + "&pageSize=" + pageSize;
    		
        HttpEntity<String> entity = new HttpEntity<String>(headers);		
        HttpEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        Gson gson = new Gson();
        Invitation[] invitationArray = gson.fromJson(response.getBody().toString(), Invitation[].class);
        invitations = Arrays.asList(invitationArray);    
		return invitations;
		}
	
	// POST Invite
	@RequestMapping(value = "/createInvitePost", method = RequestMethod.POST)
	public @ResponseBody String saveInvite_JSON(@RequestBody String invite) {
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        headers.add("Authorization", accessToken);
        headers.add("Accept", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        
        String url;
    	url = "https://api.covapp.io/person/v1/personInvitations";
    	
        HttpEntity<String> entity = new HttpEntity<String>(invite, headers);		
        HttpEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
          
		return response.getBody().toString();
	}
	
	
	@RequestMapping(value = "/InvitationDetailsView")
	public String InvitationDetailsView(ModelMap model) {
		
		model.addAttribute("message", "Person detailed, no ID");		
		return "PersonDetailsView";		
	}
	
	
	@RequestMapping(value="/InvitationDetailsView/{inviteId}", 
	        method=RequestMethod.GET,
	        produces={"application/xml", "application/json"})
	public @ResponseBody ModelAndView getInvitationDetailed(@PathVariable("inviteId") String inviteId, ModelMap model) {      
		Invitation invitation = getInvitation(inviteId);
	    Gson gson = new Gson();
	    
	    String invitationJson = gson.toJson(invitation);
	    model.addAttribute(invitationJson);
	    return new ModelAndView("InvitationDetailsView", "invitation", invitationJson);
	}
	
	

	public Invitation getInvitation(String inviteId) {      
		Invitation invitation = new Invitation();
		RestTemplate restTemplate = new RestTemplate();
		Token token = getAccessToken(); 		//geting token data
		String tokenType = token.getToken_type();	
		String tokentTypeCapitalized = tokenType.substring(0, 1).toUpperCase() + tokenType.substring(1);	//first letter has to be capitalized
		
		String accessToken = tokentTypeCapitalized + " " + token.getAccess_token();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", accessToken);
        headers.add("Content-Type", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        headers.add("Accept", "application/vnd.com.covisint.platform.person.invitation.v1+json");
        
        String url = "https://api.covapp.io/person/v1/personInvitations?id=" + inviteId;
    		
        HttpEntity<String> entity = new HttpEntity<String>(headers);		
        HttpEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        Gson gson = new Gson();
        Invitation[] invitationArray = gson.fromJson(response.getBody().toString(), Invitation[].class);
        invitation = invitationArray[0];    
	    return invitation;
	}
}
