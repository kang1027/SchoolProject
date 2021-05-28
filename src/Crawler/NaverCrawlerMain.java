package Crawler;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** * 네이버 크롤러 메인 클래스 * * @author steel * @since 2021.02.24 */
public class NaverCrawlerMain {
	public static void main(String[] args) 
	{

	}
	public List<Map<String, Object>> getBlog(String search){
		String id = "aZ5sZju9tNvu2nnmYvXO"; 
		String secret = "4d6kWw1vQN"; 
		List<Map<String, Object>> items = null;
		try {
			NaverCrawler crawler = new NaverCrawler(); 
			String url = URLEncoder.encode(search, "UTF-8"); 
			String response = crawler.search(id, secret, url); 
			
			String[] fields = {"title", "link", "description"};
			Map<String, Object> result = crawler.getResult(response, fields);
			
			//if(result.size() > 0) System.out.println("total -> " + result.get("total"));
			
			items = (List<Map<String, Object>>) result.get("result");
			for(Map<String, Object> item : items) {
//				System.out.println("============================================");
				for(String field : fields) {
//					System.out.println(field + "-> " + item.get(field));
				}
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return items;
	}
}