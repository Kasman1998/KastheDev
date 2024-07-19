
/**
 *
 * @author beadb
 */
package Kwentin.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.BasicStroke;
import java.awt.Color;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.data.jdbc.JDBCPieDataset;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
 

/**
 * The purpose this program is to capture date from the "Data GUI" and 
 * visualized data into a live-dymnanic pie chart.
 * @author Kwentin
 */
public class PieChart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public PieChart() {

    }
/**
 * the DoGet() is used to connect to the database and call data. Once the data
 * is called it is process in a table and pie chart.
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException 
 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        try {
            
            Class.forName("oracle.jdbc.OracleDriver").newInstance();
            try {
                connection
                        = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "oracle");
            } catch (SQLException e) {
            }
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
        }
        JDBCPieDataset dataset = new JDBCPieDataset(connection);
        try {
            /**
             * exceuteQuery() method will execute query.The query will go to the userresult table in the KwentinData Database.
             * It will group the respones and count them.
             */
            dataset.executeQuery("select userresult,count(*) from KwentinData group by userresult having count(*) >=1");
            /**
             * createPieChart() method will create the pie chart and visualize the data from the KwentinData.
             */
            JFreeChart chart = ChartFactory.createPieChart("Data Symbols", dataset, true, true, false);
            OutputStream out = response.getOutputStream(); 
            chart.setBorderPaint(Color.black);
            chart.setBorderStroke(new BasicStroke(10.0f));
            chart.setBorderVisible(true);
            if (chart != null) {
                int width = 500;
                int height = 350;  
                final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                response.setContentType("image/png");
            
                ChartUtilities.writeChartAsPNG(out, chart, width, height, info);
            }
        } catch (SQLException e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException{
        
    }
}
