

package Bean;
/**
 *
 * @author Rakesh Chander
 */
public class Student {
    private String rollno;
    private String stname;
    private String gender;
    private String address;
    private String phone;
    private String email;
    private int totalpage;
    /** Creates a new instance of Student */
    public Student() {
    }
    public Student(String rollno, String stname, String gender, String address, String phone, String email, int totalpage){
        this.rollno=rollno;
        this.stname=stname;
        this.gender=gender;
        this.address=address;
        this.phone=phone;
        this.email=email;
        this.totalpage=totalpage;
    }
    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getStname() {
        return stname;
    }

    public void setStname(String stname) {
        this.stname = stname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }
    
}
