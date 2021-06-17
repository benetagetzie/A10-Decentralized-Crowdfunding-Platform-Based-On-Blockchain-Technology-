
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class NoobChain {
	
	public static ArrayList<Block> blockchain = new ArrayList<>();
	public static int difficulty = 5;
        static int i =5;
          

	public static void main(String[] args) {	
		//add our blocks to the blockchain ArrayList:
            
		
		try{                   
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdfund","root","password");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("Select * from transaction");
                    addBlock(new Block("Genius block","0"));
                    while(rs.next()){
                        String qrvalue = rs.getString("fname");
                        String username = rs.getString("frname");
                        String currentdate = rs.getString("accno");
                        String amount = rs.getString("amount");
                        String date = rs.getString("date");
                        String time = rs.getString("time");
                        String mail = rs.getString("email");
                        String all = qrvalue+username+currentdate+amount+date+time+mail;
                        while(true)
                        {                            
                        addBlock(new Block(all, blockchain.get(blockchain.size()-1).hash));
                        String blockchainJson = StringUtil.getJson(blockchain);
                        System.out.println("\nThe block chain: ");
                        System.out.println(blockchainJson);
                        }
                        
                    }
                   
                   
                }
                catch(ClassNotFoundException | SQLException e){
                    System.out.println(e);
                }
		
		
	}
	
	public static Boolean isChainValid() {
		Block currentBlock; 
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace('\0', '0');
		
		//loop through blockchain to check hashes:
		for(int i=1; i < blockchain.size(); i++) {
			currentBlock = blockchain.get(i);
			previousBlock = blockchain.get(i-1);
			//compare registered hash and calculated hash:
			if(!currentBlock.hash.equals(currentBlock.calculateHash()) ){
				System.out.println("Current Hashes not equal");			
				return false;
			}
			//compare previous hash and registered previous hash
			if(!previousBlock.hash.equals(currentBlock.previousHash) ) {
				System.out.println("Previous Hashes not equal");
				return false;
			}
			//check if hash is solved
			if(!currentBlock.hash.substring( 0, difficulty).equals(hashTarget)) {
				System.out.println("This block hasn't been mined");
				return false;
			}
			
		}
		return true;
	}
	
	public static void addBlock(Block newBlock) {
		newBlock.mineBlock(difficulty);
		blockchain.add(newBlock);
	}
}
