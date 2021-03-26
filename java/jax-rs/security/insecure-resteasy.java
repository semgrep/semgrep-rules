package unsafe.jaxrs;

import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("/")
public class PoC_resource {
	@POST
	@Path("/concat")
	@Produces(MediaType.APPLICATION_JSON)
	// ruleid: insecure-resteasy-deserialization
	@Consumes({"*/*"})
	public Map<String, String> doConcat(Pair pair) {
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("Result", pair.getP1() + pair.getP2());

		return result;
	}
	// ruleid:default-resteasy-provider-abuse
	@POST
	@Path("/vulnerable")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, String> doConcat(Pair pair) {
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("Result", pair.getP1() + pair.getP2());

		return result;
	}

	@POST
	@Path("/count")
	@Produces(MediaType.APPLICATION_JSON)
	// ok: insecure-resteasy-deserialization
	@Consumes(MediaType.APPLICATION_JSON)
	public Map<String, Integer> doCount(ArrayList<Object> elements) {
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		result.put("Result", elements.size());

		return result;
	}
	
}