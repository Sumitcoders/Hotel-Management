'''
Admin Login
Customer Login
Room Management
Room Reservation
Food management
billing
feedback
hotel details
logs
'''
from datetime import datetime
import mysql.connector as sql
from tabulate import tabulate
import random
# Connect to server

try:
    conn = sql.connect(
        host="localhost",
        port=3306,
        user="root",
        password="hahqymol",
        database='Hotel_Celestial',
        auth_plugin='mysql_native_password')


    #Creating Cursor

    cur = conn.cursor()

    Status = None




    #FUNCTIONS
    def day_counter(date1, date2):
        d1 = datetime.strptime(date1, '%Y-%m-%d')
        d2 = datetime.strptime(date2, '%Y-%m-%d')
    
        delta = abs((d2 - d1).days)
    
        return delta


    def vacent(r_t):
        cur.execute(f"select room_no from rooms where status = 'vacent' and type = '{r_t}'")
        vacent_rooms = cur.fetchall()
        v = random.randint(0,len(vacent_rooms)-1)
        r_no = int(vacent_rooms[v][0])
        return r_no
    def display(tname):
        cur.execute(f"Select * from {tname}")
        r = cur.fetchall()
        columns = [i[0] for i in cur.description]
        print(tabulate(r, headers=columns, tablefmt="fancy_grid"))

    def valid_contact(number):
        if len(str(number)) != 10:
            print("Invalid Contact Number")
            exit()
        else:
            return True

    #Admin interface

    def Admin_Login(Username,password):
        cur.execute("Select * from Admins")
        r = cur.fetchall()
        if (Username,password) in r:
            print("Access Granted")
            return True
        else:
            print("Access Denied")
            return False

    def logs():
        if Status != "Admin":
            return
        cur.execute("select log_id from logs")
        logid = cur.fetchall()
        if len(logid)>=200:
            l = min(logid)
            cur.execute(f"delete logs from logs JOIN(select min(log_id) as min from logs) as subquery on logs.log_id = subquery.min" )
        display("logs")
            #cur.execute("select log_id from logs")
            #logid = cur.fetchall()

    #Customer registration

    def register(name,contact,email):
        try:
            cur.execute(f'select contact from customer where contact = {contact}')
            no = cur.fetchone()
            if no != None:
                print('This contact number already exist')
                return
            
            cur.execute("Select C_ID from logs")
            a = cur.fetchall()
            if a == []:
                cid = random.randint(1000,2001)
            else:
                cur.execute("select MAX(C_ID) from logs")
                cid = int(cur.fetchone()[0])+1
            cur.execute(f'insert into customer values({cid},"{name}",NULL,{int(contact)},"{email}",default,NULL)')
            print('Registered in succesfully')
            conn.commit()
        except Exception as e:
            print(line2)
            print(e)
            print(line2,'\n')
            print("Task failed, an exception occured")
            exit()
        
        
        
        

    #booking room
    def book(name,c_id,log_id):
        try:
            print("Available types of room in our service")
            print('1. Single Bedroom           :2000$')
            print('2. Double Bedroom           :3000$')
            print('3. Dulex Double Bedroom     :4000$')
            print('4. Luxary                   :7000$')
            print(" {Charges are based on per night} ")
            r_choice = int(input("Enter your choice: "))
            if r_choice == 1:
                r_type = 'Single Bedroom'
            elif r_choice == 2:
                r_type = 'Double Bedroom'
            elif r_choice == 3:
                r_type = 'Dulex Double Bedroom'
            elif r_choice == 4:
                r_type = 'Luxary'
            else:
                print("Invalid Room Type")
                return
            room = vacent(r_type)
            print(r_type)
            cur.execute(f"insert into logs values('{name}',{c_id},curdate(),curtime(),NULL,NULL,{room},{log_id})")
            print(1)
            cur.execute(f"update rooms set status = 'occupied' where room_no = {int(room)}")
            print(2)
            cur.execute(f"update customer set status = 'In' where C_ID = {c_id}")
            cur.execute(f"update customer set room_no = {room} where C_ID = {c_id}")
            cur.execute(f"update customer set room_type = '{r_type}' where C_ID = {c_id}")
            conn.commit()
    
            

        except Exception as e:
            print(line2)
            print(e)
            print(line2)
            print("Task failed because an exception has occurerd")
            exit()  
        print(line4)
        print(f"Thank you {name} for choosing us.")
        print("Booking successful")
        print("Your room Number is: ",room)
        print(line4)
    def format_text(text,ln):
        l = text.split()
        t = ""
        a = 0
        for i in l:
            if a%ln == 0 and a != 0:
                t = t + '\n'
                t = t + i + ' '
            else:
                t = t + i + ' '
            a+=1
        return t
        


        

    #Greeting


    line1 = "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
    line2 = "+===============================================================+"
    line3 = "+---------------------------------------------------------------+"
    line4 = "+***************************************************************+"
    print(line1)
    print("|"," "*61,"|")
    print("|                   Welcome to Hotel Celestial                  |")
    print("|"," "*61,"|")
    print(line1)
    print()



            


    #login
    print("1.Admin \n2.Customer")
    a = input("Enter Your Role:")
    print(line1)

    # checking for Admin
    if a.lower() == "admin" or a == '1':
        print("Admin Login")
        user = input("Enter your Username:-")
        passwd = input("Enter your Password:-")
        if Admin_Login(user,passwd):
            Status = "Admin"
            print("Welcome",user)
            while True:

                
                print("1. Check Logs (Past 200)")
                print("2. Check Accomodations")
                print("3. Fine")
                print("4. View Feedbacks")
                print("5. Clear All Feedbacks")
                print("6. Exit")
                ch = int(input("Enter your choice: "))
                print(line1)
                if ch == 1:
                    logs()
                    input("Press 'ENTER' to continue")
                elif ch == 2:
                    cur.execute(f"Select C_Id 'Customer ID',name 'Name',room_no 'Room NO.' , contact 'Contact',email 'Email ID' , status 'Status',room_type 'Room Type' from customer where status = 'In'")
                    r = cur.fetchall()
                    columns = [i[0] for i in cur.description]
                    print(tabulate(r, headers=columns, tablefmt="fancy_grid"))
                    input("Press 'ENTER' to continue")
                
                elif ch == 3:
                    print(line2)
                    cur.execute(f"Select C_Id 'Customer ID',name 'Name',room_no 'Room NO.' from customer where status = 'In'")
                    r = cur.fetchall()
                    columns = [i[0] for i in cur.description]
                    print(tabulate(r, headers=columns, tablefmt="fancy_grid"))
                    print(line2)
                    cid = int(input("Enter the Customer ID: "))
                    cur.execute(f'select name from customer where C_ID = {cid}')
                    name = cur.fetchall()
                    name = name[0][0]
                    descr = input("Enter the decription for fine {in 100 words}: ")
                    descr = format_text(descr,7)

                    fine = int(input("Enter the amount of fine: "))
                    cur.execute(f"insert into bill values({cid},'{descr}','FINE',{fine})")
                    conn.commit()
                    print(line2)
                    print("Fined",name)
                    print(line2)
                elif ch == 4:
                    print(line4)
                    display('feedback')
                    print(line4)
                    input("Press 'ENTER' to continue ")
                elif ch == 5:
                    print(line4)
                    print(line4)
                    print("!Warning! this will permanently remove all the feedbacks in the database")
                    print(line4)
                    print(line4)
                    con = input("Press 'y' to continue: ")
                    if con.lower() == 'y':
                        captcha = random.randint(10000,99999)
                        print("Captcha: ",captcha)
                        captcha_in = int(input("Enter the captcha: "))
                        if captcha == captcha_in:
                            print("Removing all the feedbacks")
                            cur.execute("delete from feedback")
                            conn.commit()
                            print(line1)
                            print("Task complete!")
                            print(line1)
                        else:
                            print("Wrong Captcha")
                elif ch == 6:
                    conf = input("Are you sure you want to exit! (y/n): ")
                    
                    if conf.lower() != 'y':
                        continue
                    else:
                        break
                else:
                    print("Invalid Choice")

    


    #checking for customer

    elif a.lower() == "customer" or a == '2':
        while True:
            print("1. Register")
            print("2. Booking")
            print("3. Login")
            print('4. Restaurant')
            print('5. EXIT')
            c_in = int(input("Enter choice: "))
            print(line1)
            if c_in == 1:
                print("Enter your details")
                name = input("Enter your Name: ")
                contact = int(input("Enter your Contact Number: "))
                valid_contact(contact)
                email = input("Enter your Email ID: ")
                if '@gmail.com' not in email:
                    print('Invalid Gmail')
                register(name,contact,email)
            
            elif c_in == 2:
                #matching details using phone number
                c_in2_contact = int(input("Enter your contact number: "))
                valid_contact(c_in2_contact)
                cur.execute(f"select name from customer where contact = {c_in2_contact}")
                c_in2_name = cur.fetchone()
                
                if c_in2_name == None:
                    print(line3)
                    print("No match for this contact number")
                    print("\nmake sure to register before booking")
                    print(line3)
                    exit()
                else:
                    c_in2_name = c_in2_name[0]
                    
                
                
                cur.execute(f"select C_ID from customer where contact = {c_in2_contact}")
                c_in2_cid = cur.fetchone()[0]
                
                
                #checking fro empty log
                cur.execute("select log_id from logs")
                l_id = cur.fetchall()
                if l_id == []:
                    l_id = 1
                else:
                    cur.execute("Select max(log_id) from logs")
                    l_id = cur.fetchone()[0] + 1
                #checking for already booked
                cur.execute(f"select status from customer where  contact = {c_in2_contact} ")
                temp = cur.fetchall();
                if temp[0][0] != 'In':
                    print('Booking you a room')
                    book(c_in2_name,c_in2_cid,l_id)
                else:
                    print("There already exist a booking with this contact")
                
                

            elif c_in == 3:
                c_in3_contact = int(input("Enter your contact number: "))
                valid_contact(c_in3_contact)
                cur.execute(f"select name,C_ID from customer where contact = {c_in3_contact} and status = 'In'")
                name = cur.fetchone()
                if name == None:
                    print("No such booking exist")
                    print("Make sure you have done your booking first")
                else:
                    c_in3_cid = name[1]
                    name = name[0]
                    print(f"welcome {name}")
                    
                    while True:
                        print(line4)
                        print("1. View Menu")
                        print("2. Your Orders")
                        print("3. Order Food")
                        print("4. Check Out")
                        print("5. Current Bill")
                        print("6. Feedback")
                        print("7. Log Out")
                        print(line4)
                        c_login_in = int(input("Enter your choice: "))
                        if c_login_in == 1:
                            display("Menu")
                            input("Press ENTER to continue ")
                        elif c_login_in == 2:
                            
                            cur.execute(f"select Name,Amount,Price from orders where C_ID = {c_in3_cid}")
                            r = cur.fetchall()
                            columns = [i[0] for i in cur.description]
                            print(tabulate(r, headers=columns, tablefmt="fancy_grid"))
                            input("press ENTER to continue ")

                        elif c_login_in == 3:
                            display("Menu")
                            p_id = int(input("Enter P_ID of the food you want to order or '0' to terminate the process\n: "))
                            if p_id == 0:
                                continue
                            cur.execute("select P_ID from Menu")
                            l = cur.fetchall()
                            p = []
                            for i in l:
                                p.append(i[0])
                            if p_id in p:
                                pass
                            else:
                                print("Product not found with this P_ID")
                                continue
                                
                            
                            amt = int(input("Enter the Amount of the item: "))
                            cur.execute(f'select Price from Menu where P_ID = {p_id}')
                            
                            p = cur.fetchone()
                            pr = (p[0]*amt)
                            cur.execute(f"insert into orders values({c_in3_cid},{p_id},(select Name from Menu where P_ID = {p_id}),{amt},{pr})")
                            cur.execute(f"insert into bill values({c_in3_cid},(select Name from Menu where P_ID = {p_id}),'FOOD',{pr})")
                            print(line4)
                            print("Your order has been placed check 'Your Orders' to see all orders")
                            conn.commit()
                        
                        elif c_login_in == 4:
                            confirmation = input("Are you sure to 'Check Out' from the hotel! (y/n): ")
                            if confirmation.lower() == 'y':
                                captcha_out = random.randint(10000,99999)
                                print("Captcha: ",captcha_out)
                                captcha_out_in = int(input("Enter the captcha: "))
                                if captcha_out == captcha_out_in:
                                    cur.execute(f"update logs set check_out = curdate() where C_ID = {c_in3_cid};")
                                    cur.execute(f"update logs set out_time = curtime() where C_ID = {c_in3_cid};")
                                    cur.execute(f"delete from orders where C_ID = {c_in3_cid}")
                                    cur.execute(f"select room_no from customer where C_ID = {c_in3_cid}")
                                    room_n = cur.fetchone()
                                    
                                    room_n = room_n[0]
                                    

                                    cur.execute(f"select check_in,check_out from logs where C_ID = {c_in3_cid} ")
                                    temp = cur.fetchall()
                                    day1 = str(temp[0][0])
                                    day2 = str(temp[0][1])
                                    total_days = day_counter(day1,day2)
                
                                    cur.execute(f'select room_type from customer where C_ID = {c_in3_cid}')
                                    typ = cur.fetchone()
                                    typ = typ[0]
                                    price = 0
                                    if typ == 'Single Bedroom':
                                        price = 2000
                                    elif typ == 'Double Bedroom':
                                        price = 3000
                                    elif typ == 'Dulex Double Bedroom':
                                        price = 4000
                                    elif typ == 'Luxary':
                                        price = 7000
                                    t_price = price * total_days
                                    print(t_price)
                                    
                                    cur.execute(f'insert into bill values({c_in3_cid},"Room Charges x{total_days} days","Room Rent",{t_price})')
                                    
                                    cur.execute(f"Update customer set status = 'Not in' where C_ID = {c_in3_cid}")
                                    cur.execute(f"update customer set room_no = NULL where C_ID = {c_in3_cid}")
                                    cur.execute(f'update customer set room_type = NULL where C_ID = {c_in3_cid}')
                                    cur.execute(f'update rooms set status = "vacent" where room_no = {room_n} ')

                                    cur.execute(f"Select Description,Service_Type 'Service Type',Cost from bill where c_id = {c_in3_cid}")
                                    r = cur.fetchall()
                                    columns = [i[0] for i in cur.description]
                                    print(tabulate(r, headers=columns, tablefmt="fancy_grid"))
                                    cur.execute(f"Select Cost from bill where C_ID = {c_in3_cid}")
                                    t = cur.fetchall()
                                    total = 0
                            
                                    for i in t:
                                        total += i[0]
                                    cur.execute(f"select check_in from logs where C_ID = {c_in3_cid} ")
                                    checkin = cur.fetchall()[0][0]
                            
                                    print(f"Your total payable cost till now is {total}$")
                                    conn.commit()
                                    input("Press 'ENTER' to Check Out.")
                                    break

                                else:
                                    print("Wrong Captcha")
                                
                                
                                

                        elif c_login_in == 5:
                            cur.execute(f"Select Description,Service_Type 'Service Type',Cost from bill where c_id = {c_in3_cid}")
                            r = cur.fetchall()
                            columns = [i[0] for i in cur.description]
                            print(tabulate(r, headers=columns, tablefmt="fancy_grid"))
                            cur.execute(f"Select Cost from bill where C_ID = {c_in3_cid}")
                            t = cur.fetchall()
                            total = 0
                            
                            for i in t:
                                total += i[0]
                            cur.execute(f"select check_in from logs where C_ID = {c_in3_cid} ")
                            checkin = cur.fetchall()[0][0]
                            
                            print(f"Your total payable cost till now is {total}$")
                            print("+-----------------------------------------------------------------------------+")
                            print("|  The above cost is excluding of room rent charges which will be applied to  |" )
                            print(f"|the bill at the time of check out from your check in date i.e from {checkin}|")
                            print("+-----------------------------------------------------------------------------+")

                            input("Press 'ENTER' to continue")


                            
                        elif c_login_in == 6:
                            f = input("Enter your feedback: ")
                            f = format_text(f,10)
                            cur.execute(f'insert into feedback values("{name}","{f}")')
                            conn.commit()
                            print(line2)
                            print("Thank you very much for your feedback!")
                            print(line2)
                        elif c_login_in == 7:
                            print(line1)
                            c = input("Are you sure you want to log out! (y/n): ")
                            if c.lower() != 'y':
                                print(c.lower())
                                continue
                            print(line1)
                            print("Logged Out Successfully")
                            print(line1)
                            break

                        else:
                            print("invalid Choice")
            elif c_in == 5:
                break
            else:
                    print("Invalid choice")
        
    else:
        print("There is no such role")
        print(a.lower())
except Exception as e:
    print(line1)
    print("An exception has occured, Terminating the program...")
    print(line1)
    print(e)
    print(line1)
    exit()
input("Press 'ENTER' to exit")