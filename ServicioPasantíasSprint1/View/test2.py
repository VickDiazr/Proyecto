#Creating a simple GUI registration form using Tkinter in Python  
#import the tkinter module into our code  
from tkinter import *  
  
#Creating the object 'base' of the Tk()  
base = Tk()  
  
#Using the Geometry method to the form certain dimensions  
base.geometry("550x550")  
  
#Using title method to give the title to the window  
base.title('Registration form')  
  
#Now, we will use 'Label' method to add widget in the Registration Form and also use place() method to set their positions.  
lbl_0 = Label(base, text="Registration form", width=20,font=("bold",20))  
  
#the place method in tkinter module helps user to set the geometry, that is, the dimensions of a certain widget by placing them at a certain position  
lbl_0.place(x=90,y=60)  
  
#Using 'Label' widget to create Full name label and using place() method to set its position.  
lbl_1 =Label(base, text= "FullName", width=20,font=("bold",10))  
lbl_1.place(x=80,y=130)  
  
#Using Enrty widget to make a text entry box for accepting the input string in text from user.  
enter_1 = Entry(base)  
enter_1.place(x=240,y=130)  
  
#Using 'Label' widget to create Email label and using place() method to set its position.  
lbl_3 = Label(base, text="Email", width=20,font=("bold",10))  
lbl_3.place(x=68,y=180)  
  
#Using Enrty widget to make a text entry box for accepting the input string in text from user.  
enter_3 = Entry(base)  
enter_3.place(x=240,y=180)  
  
#Using 'Label' widget to create Gender label and using place() method to set its position.  
lbl_4 = Label(base, text="Gender", width=20,font=("bold",10))  
lbl_4.place(x=70,y=230)  
  
  
#Using variable 'vars' to store the integer value, which by deault is 0  
vars = IntVar()  
  
#Using Radio button widget to create an option choosing button and using place() method to set its position.  
Radiobutton(base, text="Male", padx= 5, variable= vars, value=1).place(x=235, y=230)  
Radiobutton(base, text="Female", padx= 20, variable= vars, value=2).place(x=290,y=230)  
  
  
#Using 'Label' widget to create Countries label and using place() method, set its position.  
lbl_5=Label(base, text ="Country", width=20,font=("bold",11))  
lbl_5.place(x=70,y=280)  
  
#this creates list of countries available in the dropdown list.  
list_of_cntry=[ 'India' ,'Canada' , 'US' ,'Germany' ,'UK']  
  
#the variable 'cv' is introduced to store the String Value, which by default is (empty) ""  
cv = StringVar()  
drplist = OptionMenu(base, cv, *list_of_cntry)  
drplist.config(width=15)  
cv.set('Select your Country')  
drplist.place(x=240, y=280)  
  
#Using 'Label' widget to create Language label and using place() method, set its position.  
lbl_6=Label(base, text="Language", width=20,font=('bold',10))  
lbl_6.place(x=75,y=330)  
  
  
#the new variable 'vars1' is created to store Integer Value, which by default is 0.  
vars1=IntVar()  
#Using the Checkbutton widget to create a button and using place() method to set its position.  
Checkbutton(base,text="English", variable = vars1).place(x=230,y=330)  
  
#the new variable 'vars1' is created to store Integer Value, which by default is 0.  
vars2=IntVar()  
#Using the Checkbutton widget to create a button and using place() method to set its position.  
Checkbutton(base, text="German", variable=vars2).place(x=290, y=330)  
  
#Using the Button widget, we get to create a button for submitting all the data that has been entered in the entry boxes of the form by the user.  
Button(base, text='Submit' , width=20, bg="black",fg='white').place(x=180,y=380)  
  
  
#Calling the mainloop method to execute the entire program.  
base.mainloop()  