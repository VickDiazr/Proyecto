from distutils.command.config import config
from doctest import master
from multiprocessing import current_process
import tkinter
import tkinter.messagebox
from turtle import width
from urllib import response
import customtkinter
from PIL import Image, ImageTk
from matplotlib.ft2font import BOLD
import sys
from matplotlib.pyplot import text
from numpy import var
from pyparsing import White
#from Controller import LoginMenu

class App (customtkinter.CTk):
    WIDTH = 1366
    HEIGHT = 768
    pagesbehind = []
    pagesforward = []
    currentpage = ""

    def on_close(self, event=0):
        response = tkinter.messagebox.askyesno('Cerrar la aplicación','¿Está seguro de que desea cerrar la aplicación?')
        if response:
            sys.exit()
        
    def __init__(self):
        # ================ Basic Window Options ================= 
        super().__init__()
        self.currentpage = "LoginMenu"
        print(App.currentpage)
        self.title("Servicio de Pasantías")

        # ================ Center Window + Close Configuration ================= 
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        centerx = int(screen_width/2 - App.WIDTH/2)
        centery = int(screen_height/2 - App.HEIGHT/2)

        self.geometry(f"{App.WIDTH}x{App.HEIGHT}+{centerx}+{centery}")
        self.protocol("WM_DELETE_WINDOW", self.on_close)  #Calls .on_close() when app gets closed

        # ================ Handle Images ================= 
        unphotoicon = Image.open(r'View\Images\Capybara.png')
        photoicon = ImageTk.PhotoImage(unphotoicon)
        self.iconphoto(False,photoicon)

        unphotoUN = Image.open(r'View\Images\Logo UN.png')
        unphotoUN = unphotoUN.resize((279,125))
        photoUN = ImageTk.PhotoImage(unphotoUN)

        unphotoback = Image.open(r'View\Images\Back.png')
        unphotoback = unphotoback.resize((35,35))
        photoback = ImageTk.PhotoImage(unphotoback)

        unphotoforward = Image.open(r'View\Images\Forward.png')
        unphotoforward = unphotoforward.resize((35,35))
        photoforward = ImageTk.PhotoImage(unphotoforward)

        unphotouser= Image.open(r'View\Images\User.png')
        unphotouser = unphotouser.resize((30,30))
        photouser = ImageTk.PhotoImage(unphotouser)

        unphotopassword = Image.open(r'View\Images\Password.png')
        unphotopassword = unphotopassword.resize((30,30))
        photopassword = ImageTk.PhotoImage(unphotopassword)

        unphotopasswordun = Image.open(r'View\Images\Passwordun.png')
        unphotopasswordun = unphotopasswordun.resize((30,30))
        photopasswordun = ImageTk.PhotoImage(unphotopasswordun)

        # ================ Forward and Backwards Buttons =================
        def Forwardpage():
            if len(self.pagesforward) == 0:
                tkinter.messagebox.showinfo(message="No hay una ventana posterior.",title="Información")
            if str(self.pagesforward[-1]) == "LoginMenu":
                self.pagesbehind.append(self.currentpage)
                self.currentpage = "LoginMenu"
                self.deiconify()
                self.pagesforward.pop()
            if str(self.pagesforward[-1]) == "RegisterMenu":
                self.pagesbehind.append(self.currentpage)
                self.currentpage = "RegisterMenu"
                self.pagesforward.pop()
                popRegistro()
                
        def Behindpage():
            if len(self.pagesbehind) == 0:
                tkinter.messagebox.showinfo(message="No hay una ventana previa.",title="Información")
            if str(self.pagesbehind[-1]) == "LoginMenu":
                self.pagesforward.append(self.currentpage)
                self.currentpage = "LoginMenu"
                self.deiconify()
                self.pagesbehind.pop()                
            if str(self.pagesbehind[-1]) == "RegisterMenu":
                self.pagesforward.append(self.currentpage)
                self.currentpage = "RegisterMenu"                
                self.pagesbehind.pop()
                popRegistro()
                
        # ================ Register Window (TopLevel) =================
        def popRegistro(*args):
            self.currentpage="RegisterMenu"
            self.withdraw()
            vRegistro = customtkinter.CTkToplevel()
            vRegistro.geometry(f"{App.WIDTH}x{App.HEIGHT}+{centerx}+{centery}")
            vRegistro.title("Servicio de Pasantías")
            vRegistro.protocol("WM_DELETE_WINDOW", self.on_close)
            vRegistro.iconphoto(False, photoicon)

            # ================ Handle Grid Weight (For Resizing) ================= 
            vRegistro.grid_columnconfigure(0, weight=1)
            vRegistro.grid_rowconfigure(0, weight=0)
            vRegistro.grid_rowconfigure(1, weight=1)

            # ================ Handle Main Frames ================= 
            vRegistro.frame_up = customtkinter.CTkFrame(border_width=1, master=vRegistro, width=1366, height=100, corner_radius=0, fg_color="#565a5c")
            vRegistro.frame_up.grid(row=0, column=0, sticky="nswe")

            vRegistro.frame_down = customtkinter.CTkFrame(border_width=1, master=vRegistro, width=1366, height=669, corner_radius=0, fg_color="#94b43b")
            vRegistro.frame_down.grid(row=1, column=0, sticky="nswe")

            # ================ Handle Widgets ==================
            vRegistro.label_logo = customtkinter.CTkLabel(master=vRegistro, borderwidth=1,image = photoUN).place(x = 80, y = -1)
            vRegistro.label_logo = photoUN # Logo label

            vRegistro.backbutton = customtkinter.CTkButton(master=vRegistro, border_width=1, border_color="Black", text = "", width = 40, height = 40, 
                                                     image = photoback, fg_color="#565a5c", corner_radius=0,
                                                     command=lambda:[vRegistro.destroy(), Behindpage()]).place(x = 1, y = -1)
            vRegistro.backbutton = photoback # Back Button

            vRegistro.forwardbutton = customtkinter.CTkButton(master=vRegistro, border_width=1, border_color="Black", text ="", width = 40, height = 40,
                                                     image = photoforward, fg_color="#565a5c", corner_radius=0,
                                                     command=lambda:[vRegistro.destroy(), Forwardpage()]).place(x = 41, y = -1)
            vRegistro.forwardbutton = photoforward # Forward Button
            
            
            # ================ Handle Middle Main Frame ================= 
            vRegistro.frame_middle = customtkinter.CTkFrame(border_width=1, master=vRegistro, width=1280, height=600, corner_radius=50, fg_color="#565a5c", bg_color="#94b43b")
            vRegistro.frame_middle.grid(row=1, column=0, padx = 80, pady = 80, sticky ="nswe")

            # ================ Handle Frame Weight (For Resizing) ================= 
            vRegistro.frame_middle.rowconfigure(0, weight=0)
            vRegistro.frame_middle.rowconfigure(1, weight=0)
            vRegistro.frame_middle.rowconfigure(2, weight=0)
            vRegistro.frame_middle.rowconfigure(3, weight=0)
            vRegistro.frame_middle.rowconfigure(4, weight=1)
            vRegistro.frame_middle.columnconfigure(0, weight=0)
            vRegistro.frame_middle.columnconfigure(1, weight=1)
            vRegistro.frame_middle.columnconfigure(2, weight=1)
            vRegistro.frame_middle.columnconfigure(3, weight=1)
            vRegistro.frame_middle.columnconfigure(4, weight=0)       
            # ================ Invisible Space Lines =================
            vRegistro.frame_line1 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
            vRegistro.frame_line1.grid(row=2, column=0, sticky ="nswe")

            vRegistro.frame_line2 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
            vRegistro.frame_line2.grid(row=3, column=0, sticky ="nswe")

            vRegistro.frame_line4 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
            vRegistro.frame_line4.grid(row=7, column=0, sticky ="wnse")

            vRegistro.frame_line5 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
            vRegistro.frame_line5.grid(row=9, column=0, sticky ="ns")

            vRegistro.frame_line6 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
            vRegistro.frame_line6.grid(row=11, column=0, sticky ="")

            # ================ Handle Middle Frame Widgets =================
            vRegistro.label_maintitle = customtkinter.CTkLabel(master=vRegistro.frame_middle, text="Menú de Registro", text_font=("Urbanist", -22, "bold"), text_color="White") 
            vRegistro.label_maintitle.grid(row=0, column = 2, pady = 10, sticky = "")

            vRegistro.frame_line1 = customtkinter.CTkFrame(master=vRegistro.frame_middle, width=2000, height=2, bg_color="White", fg_color="White")
            vRegistro.frame_line1.grid(row=1, column=0, sticky ="we", columnspan = 4)

            vRegistro.label_maintitle = customtkinter.CTkLabel(master=vRegistro.frame_middle, text="Seleccione según corresponda", text_font=("Urbanist", -15), text_color="White") 
            vRegistro.label_maintitle.grid(row=2, column = 2, sticky = "")

            # ================ Handle Middle Student Frame =================             
            vRegistro.frame_middle.framest = customtkinter.CTkFrame(border_width=0, master=vRegistro.frame_middle, width=1280, height=370, corner_radius=30,
                                                                 fg_color="White", bg_color="#565a5c")
            vRegistro.frame_middle.framest.grid(row=4, column=0, padx = 20, pady = 15, sticky ="nswe", columnspan = 4)
            vRegistro.frame_middle.framest.grid_forget()

            # ================ Handle Middle Teacher Frame =================             
            vRegistro.frame_middle.framete = customtkinter.CTkFrame(border_width=0, master=vRegistro.frame_middle, width=1280, height=370, corner_radius=30,
                                                                 fg_color="White", bg_color="#565a5c")
            vRegistro.frame_middle.framete.grid(row=4, column=0, padx = 20, pady = 15, sticky ="nswe", columnspan = 4)
            vRegistro.frame_middle.framete.grid_forget()

            # ================ Handle Middle Company Frame =================                         
            vRegistro.frame_middle.frameco = customtkinter.CTkFrame(border_width=0, master=vRegistro.frame_middle, width=1280, height=370, corner_radius=30,
                                                                 fg_color="White", bg_color="#565a5c")
            vRegistro.frame_middle.frameco.grid(row=4, column=0, padx = 20, pady = 15, sticky ="nswe", columnspan = 4)
            vRegistro.frame_middle.frameco.grid_forget()

            # ================ Handle Small Middle Frame Widgets =================
            def Estudiante():
                vRegistro.frame_middle.framest.grid(row=4, column=0, padx = 20, pady = 15, sticky ="nswe", columnspan = 4)

                # ================ Handle Middle Student Frame Widgets ================= 
                vRegistro.frame_linev = customtkinter.CTkFrame(master=vRegistro.frame_middle.framest, width=2, height=20, bg_color="Black")
                vRegistro.frame_linev.grid(row=0, column=2, sticky ="ns", rowspan=5, padx=10)

                #vRegistro.frame_lineh = customtkinter.CTkFrame(master=vRegistro.frame_middle.framest, width=256, height=2, bg_color="Black")
                #vRegistro.frame_lineh.grid(row=5, column=0, sticky ="we", columnspan = 4, padx =20)

                vRegistro.namestu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese su nombre:", text_font=("Urbanist", -15), text_color="Black",
                                                            anchor="w", width=250, height=20)
                vRegistro.namestu.grid(row=0, column = 0, sticky = "", padx=15, pady=10)
   
                vRegistro.nameentry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.nameentry.grid(row=0, column=1, sticky="", padx=15, pady=10)

                vRegistro.lastnamestu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese su apellido:", text_font=("Urbanist", -15), text_color="Black",
                                                                anchor="w", width=250, height=20) 
                vRegistro.lastnamestu.grid(row=1, column = 0, sticky = "", padx=15, pady=10)

                vRegistro.lastnameentry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                                border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.lastnameentry.grid(row=1, column=1, sticky="", padx=15, pady=10)

                vRegistro.idstu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese su número de identificación:", text_font=("Urbanist", -15), text_color="Black",
                                                        anchor="w", width=250, height=20) 
                vRegistro.idstu.grid(row=2, column = 0, sticky = "", padx=15, pady=10)

                vRegistro.identry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.identry.grid(row=2, column=1, sticky="", padx=15, pady=10)

                vRegistro.mailstu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese su correo eléctronico:", text_font=("Urbanist", -15), text_color="Black",
                                                    anchor="w", width=250, height=20) 
                vRegistro.mailstu.grid(row=3, column = 0, sticky = "", padx=15, pady=10)

                vRegistro.mailentry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=16, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.mailentry.grid(row=3, column=1, sticky="", padx=15, pady=10)

                vRegistro.sedestu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Seleccione su sede:", text_font=("Urbanist", -15),
                                                            text_color="Black", anchor="w", width=250, height=20) 
                vRegistro.sedestu.grid(row=0, column = 3, sticky = "", padx=15, pady=10)

                vRegistro.sededrop = customtkinter.CTkComboBox(master=vRegistro.frame_middle.framest, width=250, height=20, fg_color="White", corner_radius=10,
                                                            border_color="Black", text_color="Black", values=["","Amazonia", "Bogotá", "Caribe", "De La Paz", "Manizales", 
                                                            "Medellín", "Orinoquia", "Palmira", "Tumaco"], border_width=2, text_font=("Urbanist", -13))
                vRegistro.sededrop.grid(row=0, column=4, sticky="", padx=15, pady=10)

                vRegistro.facustu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Seleccione su facultad:", text_font=("Urbanist", -15),
                                                            text_color="Black", anchor="w", width=250, height=20) 
                vRegistro.facustu.grid(row=1, column = 3, sticky = "", padx=15, pady=10)

                vRegistro.facudrop = customtkinter.CTkComboBox(master=vRegistro.frame_middle.framest, width=250, height=20, fg_color="White", corner_radius=10,
                                                            border_color="Black", text_color="Black", values=["","Artes", "Ciencias", "Ciencias Económicas", "Ciencias Agrarias",
                                                            "Ciencias Humanas", "Derecho, Ciencias Políticas y Sociales", "Medicina", "Odontología", "Enfermería",
                                                            "Medicina Veterinaria y de Zootecnia", "Ingeniería"], border_width=2, text_font=("Urbanist", -13))
                vRegistro.facudrop.grid(row=1, column=4, sticky="", padx=15, pady=10)

                vRegistro.carrerastu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Seleccione su carrera:", text_font=("Urbanist", -15),
                                                            text_color="Black", anchor="w", width=250, height=20) 
                vRegistro.carrerastu.grid(row=2, column = 3, sticky = "", padx=15, pady=10)

                vRegistro.carreradrop = customtkinter.CTkComboBox(master=vRegistro.frame_middle.framest, width=250, height=20, fg_color="White", corner_radius=10,
                                                            border_color="Black", text_color="Black", values=["","Ingenieria Agrícola", "Ingenieria Agronómica", "Ingenieria Civil",
                                                            "Ingenieria de Sistemas y Computación", "Ingenieria Eléctrica", "Ingenieria Electrónica", "Ingenieria Indstrial",
                                                            "Ingenieria Mecánica", "Ingenieria Mecatrónica", "Ingeniería Química"], border_width=2, text_font=("Urbanist", -13))
                vRegistro.carreradrop.grid(row=2, column=4, sticky="", padx=15, pady=10)

                vRegistro.infotext = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest,
                text="Ingrese un usuario y su contraseña\n(se recomienda usar el mismo usuario institucional)", text_font=("Urbanist", -15), text_color="Black",
                                                            anchor="w", width=250, height=20) 
                vRegistro.infotext.grid(row=5, column = 1, columnspan = 3, padx = 10, pady=10)

                vRegistro.usernamestu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese un nombre de usuario:", text_font=("Urbanist", -15), text_color="Black",
                                                            anchor="w", width=250, height=20)
                vRegistro.usernamestu.grid(row=6, column = 0, sticky = "", padx=15, pady=10)
   
                vRegistro.usernameentry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.usernameentry.grid(row=6, column=1, sticky="", padx=15, pady=10)

                vRegistro.passwordstu = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Ingrese una contraseña:", text_font=("Urbanist", -15), text_color="Black",
                                                            anchor="w", width=250, height=20)
                vRegistro.passwordstu.grid(row=7, column = 0, sticky = "", padx=15, pady=10)
   
                vRegistro.passwordentry = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.passwordentry.grid(row=7, column=1, sticky="", padx=15, pady=10)

                vRegistro.passwordstu2 = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, text="Verifique su contraseña:", text_font=("Urbanist", -15), text_color="Black",
                                                            anchor="w", width=250, height=20)
                vRegistro.passwordstu2.grid(row=8, column = 0, sticky = "", padx=15, pady=10)
                
                vRegistro.passwordentry2 = customtkinter.CTkEntry(master=vRegistro.frame_middle.framest, width=250, height=18, fg_color="White", corner_radius=5,
                                                            border_color="Black", text_color="Black", border_width=2, text_font=("Urbanist", -13))
                vRegistro.passwordentry2.grid(row=8, column=1, sticky="", padx=15, pady=10)

                vRegistro.RegisterButton = customtkinter.CTkButton(master=vRegistro.frame_middle.framest, border_width=1, border_color="#565a5c", text = "Registrarse", width = 400,
                                                                    height = 70, corner_radius=50, fg_color="#94b43b", text_color="White", text_font=("Urbanist", -22)).grid(row=6,
                                                                    column=3, stick="", columnspan=2, rowspan=2)
                
                vRegistro.infotext2 = customtkinter.CTkLabel(master=vRegistro.frame_middle.framest, 
                text="Verificar el llenado de los campos marcados con un *.", text_font=("Urbanist", -15), text_color="Red",
                                                            anchor="w", width=250, height=20) 
                vRegistro.infotext2.grid(row=8, column = 3, columnspan = 2, padx = 10, pady=10)
            
            #def Profesor():


            #def Empresa():


            # ================ Handle Radio Buttons ================= 

            self.type = tkinter.IntVar(value=0)

            vRegistro.typec = customtkinter.CTkRadioButton(master=vRegistro.frame_middle, text="Empresa", text_font=("Urbanist", -14), text_color="White",
                                                            variable = self.type, value=1, command= lambda:[print(self.type.get())])
            vRegistro.typec.grid(row=3, column=1, sticky="")

            vRegistro.types = customtkinter.CTkRadioButton(master=vRegistro.frame_middle, text="Estudiante", text_font=("Urbanist", -14), text_color="White", 
                                                            variable = self.type, value=2, command= lambda:[Estudiante()])
            vRegistro.types.grid(row=3, column=2, sticky="")

            vRegistro.typet = customtkinter.CTkRadioButton(master=vRegistro.frame_middle, text="Profesor", text_font=("Urbanist", -14), text_color="White",
                                                            variable = self.type, value=3, command= lambda:[print(self.type.get())])
            vRegistro.typet.grid(row=3, column=3, sticky="")                    
            
        # ================ Handle Grid Weight (For Resizing) ================= 
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)

        # ================ Handle Main Frames ================= 
        self.frame_up = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=100, corner_radius=0, fg_color="#565a5c")
        self.frame_up.grid(row=0, column=0, sticky="nswe")

        self.frame_down = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=669, corner_radius=0, fg_color="#94b43b")
        self.frame_down.grid(row=1, column=0, sticky="nswe")

        # ================ Handle Widgets ==================
        self.label_logo = customtkinter.CTkLabel(borderwidth=1,image = photoUN).place(x = 80, y = -1)
        self.label_logo = photoUN # Logo label

        self.backbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text = "", width = 40, height = 40,
                                                     image = photoback, fg_color="#565a5c", corner_radius=0, command=lambda: Behindpage()).place(x = 1, y = -1)
        self.backbutton = photoback # Back Button

        self.forwardbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text ="", width = 40, height = 40,
                                                     image = photoforward, fg_color="#565a5c", corner_radius=0, command=lambda: Forwardpage()).place(x = 41, y = -1)
        self.forwardbutton = photoforward # Forward Button

        # ================ Handle Middle Frame ================= 
        self.frame_middle = customtkinter.CTkFrame(border_width=1, master=self, width=900, height=400, corner_radius=50, fg_color="#565a5c", bg_color="#94b43b")
        self.frame_middle.grid(row=1, column=0, padx = 100, pady = 100, sticky ="nswe")

        # ================ Handle Frame Weight (For Resizing) ================= 
        self.frame_middle.rowconfigure(0, weight=0)
        self.frame_middle.rowconfigure(1, weight=0)
        self.frame_middle.rowconfigure(2, weight=1)
        self.frame_middle.rowconfigure(3, weight=1)
        self.frame_middle.rowconfigure(4, weight=0)
        self.frame_middle.rowconfigure(5, minsize=30)
        self.frame_middle.rowconfigure(6, weight=0)
        self.frame_middle.rowconfigure(7, weight=1)
        self.frame_middle.rowconfigure(8, weight=0)
        self.frame_middle.rowconfigure(9, minsize=10)
        self.frame_middle.rowconfigure(10, minsize=10)
        self.frame_middle.rowconfigure(11, weight=1)
        self.frame_middle.columnconfigure(0, weight=2)
        
        # ================ Invisible Space Lines =================
        self.frame_line1 = customtkinter.CTkFrame(master=self.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
        self.frame_line1.grid(row=2, column=0, sticky ="nswe")

        self.frame_line2 = customtkinter.CTkFrame(master=self.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
        self.frame_line2.grid(row=3, column=0, sticky ="nswe")

        self.frame_line4 = customtkinter.CTkFrame(master=self.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
        self.frame_line4.grid(row=7, column=0, sticky ="wnse")

        self.frame_line5 = customtkinter.CTkFrame(master=self.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
        self.frame_line5.grid(row=9, column=0, sticky ="ns")

        self.frame_line6 = customtkinter.CTkFrame(master=self.frame_middle, width=1, height=1, bg_color="#565a5c", fg_color="#565a5c")
        self.frame_line6.grid(row=11, column=0, sticky ="")

        # ================ Handle Middle Frame Widgets =================
        self.label_maintitle = customtkinter.CTkLabel(master=self.frame_middle, text="Ingrese su usuario y contraseña", text_font=("Urbanist", -25, "bold"), text_color="White") 
        self.label_maintitle.grid(row=0, column = 0, pady = 20, sticky = "")

        self.frame_line = customtkinter.CTkFrame(master=self.frame_middle, width=1366, height=1, bg_color="White")
        self.frame_line.grid(row=1, column=0, sticky ="we")
        
        #def PrepareLogin():
        #    usuario = self.userentry.get()
        #    contraseña = self.passwordentry.get()
        #    if usuario == "" & contraseña == "":
        #        tkinter.messagebox.showerror(message="Alguno de los dos campos se encuentra vacío.",title="Error Login")
        #    elif usuario == "":
        #        tkinter.messagebox.showerror(message="El campo usuario esta vacío.",title="Error Login")
        #    elif contraseña == "":
        #        tkinter.messagebox.showerror(message="El campo contraseña esta vacío.",title="Error Login")
        #    else:
        #        resultado = Login(usuario, contraseña)
        #        if resultado == True:
        #            tkinter.messagebox.showinfo(message="Ha ingresado al sistema de forma satisfactoria.",title="Error Login")
        #        if resultado == False:
        #            tkinter.messagebox.showerror(message="No ingreso correctamente al sistema.",title="Error Login")

        self.LoginButton = customtkinter.CTkButton(master=self.frame_middle, border_width=1, border_color="#565a5c", text = "Iniciar Sesión", width = 215, height = 50,
                                                    corner_radius=0, fg_color="#94b43b", text_color="White").grid(row=8, column=0, stick="ns")
        #, command=PrepareLogin)
        self.label_registro2 = tkinter.Label(master=self.frame_middle, text="¿No está registrado? Cree su cuenta.", font=("Urbanist", -20, tkinter.UNDERLINE),
                                                fg="White", bg="#565a5c")
        self.label_registro2.grid(row=10, column = 0, pady=10, sticky = "")    

        # ================ Handle User Frame ================= 
        self.frame_user = customtkinter.CTkFrame(border_width=1, master=self.frame_middle, width=350, height=40, fg_color="White", bg_color="White", corner_radius=0)
        self.frame_user.grid(row=4, column=0, sticky ="ns")         

        self.label_user = customtkinter.CTkLabel(master=self.frame_user, fg_color="White", bg_color="White", image = photouser, 
                                                    height=40, width=40).grid(row=0, column=0, stick="nswe")
        self.label_user = photouser # User label
        
        self.userentry = customtkinter.CTkEntry(master=self.frame_user, width=300, height=40, placeholder_text="Usuario", fg_color="White",
                                                 corner_radius=0, border_color="White", text_color="Black")
        self.userentry.grid(row=0, column=1, sticky="nswe")

        # ================ Handle Password Frame ================= 
        self.frame_password = customtkinter.CTkFrame(border_width=1, master=self.frame_middle, width=350, height=40, fg_color="White", bg_color="White", corner_radius=0)
        self.frame_password.grid(row=6, column=0, sticky ="ns")         
        
        self.passwordentry = customtkinter.CTkEntry(master=self.frame_password, width=300, height=40, placeholder_text="Contraseña", fg_color="White",
                                                 corner_radius=0, border_color="White", text_color="Black", show='*')
        self.passwordentry.grid(row=0, column=1, sticky="nswe")
        
        self.label_password = customtkinter.CTkLabel(master=self.frame_password, fg_color="White", bg_color="White", image = photopassword, 
                                                    height=40, width=40)
        
        self.label_password.grid(row=0, column=0, stick="nswe")
        self.label_password = photopassword # User label

       # self.label_passwordun = customtkinter.CTkLabel(master=self.frame_password, fg_color="White", bg_color="White", image = photopassword, 
                                      #              height=40, width=40)
        
        #self.label_passwordun.grid(row=0, column=0, stick="nswe")
        #self.label_passwordun = photopasswordun # User label
        #self.label_passwordun.grid_remove()

       #def show():
        #    self.passwordentry.config(show='*')
         #   self.label_password.grid_remove()
          #  self.label_passwordun.grid(row=0, column=0, stick="nswe")

        #def hide():
        #    self.passwordentry.config(show='')
        #    self.label_password.grid(row=0, column=0, stick="nswe")
        #    self.label_passwordun.grid_remove()
        
        #self.label_password.bind("<Button-1>", show())
    #       self.label_passwordun.bind("<Button-1>", hide())
        # ================ Register Window Bind Method =================
        self.label_registro2.bind("<Button-1>", popRegistro, add="+")
        self.label_registro2.bind("<Button-1>", self.pagesbehind.append("LoginMenu"), add="+")

if __name__ == "__main__":
    app = App()
    app.mainloop()