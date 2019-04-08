package batch189.posadminlte.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class JspController {
	
	@RequestMapping("barang")
	public String barang() {
		return "barang";
	}
	
	@RequestMapping("order")
	public String order() {
		return "order";
	}

	
}