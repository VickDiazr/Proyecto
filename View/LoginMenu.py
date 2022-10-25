import tkinter
import tkinter.messagebox
from turtle import width
import customtkinter
from PIL import Image, ImageTk
from matplotlib.ft2font import BOLD
import sys

class App (customtkinter.CTk):
    WIDTH = 1366
    HEIGHT = 768

    def on_closing(self, event=0):
        self.destroy()
        sys.exit()
        
    def __init__(self):
        # ================ Basic Window Options ================= 
        super().__init__()
        
        self.title("Servicio de Pasantías")
        self.geometry(f"{App.WIDTH}x{App.HEIGHT}")
        self.protocol("WM_DELETE_WINDOW", self.on_closing)  #Calls .on_closing() when app gets closed

        # ================ Handle Grid Weight (For Resizing) ================= 
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)

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

        # ================ Handle Main Frames ================= 
        self.frame_up = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=100, corner_radius=0, fg_color="#565a5c")
        self.frame_up.grid(row=0, column=0, sticky="nswe")

        self.frame_down = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=669, corner_radius=0, fg_color="#94b43b")
        self.frame_down.grid(row=1, column=0, sticky="nswe")

        # ================ Handle Widgets ==================
        self.label_logo = customtkinter.CTkLabel(borderwidth=1,image = photoUN).place(x = 80, y = -1)
        self.label_logo = photoUN # Logo label

        self.backbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text = "", width = 40, height = 40,
                                                     image = photoback, fg_color="#565a5c", corner_radius=0).place(x = 1, y = -1)
        self.backbutton = photoback # Back Button

        self.forwardbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text ="", width = 40, height = 40,
                                                     image = photoforward, fg_color="#565a5c", corner_radius=0).place(x = 41, y = -1)
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

        # ================ Handle Frame Widgets =================
        self.label_maintitle = customtkinter.CTkLabel(master=self.frame_middle, text="Ingrese su usuario y contraseña", text_font=("Urbanist", -25, "bold"), text_color="White") 
        self.label_maintitle.grid(row=0, column = 0, pady = 20, sticky = "")

        self.frame_line = customtkinter.CTkFrame(master=self.frame_middle, width=1366, height=1, bg_color="White")
        self.frame_line.grid(row=1, column=0, sticky ="we")

        self.LoginButton = customtkinter.CTkButton(master=self.frame_middle, border_width=1, border_color="#565a5c", text = "Iniciar Sesión", width = 215, height = 50,
                                                     corner_radius=0, fg_color="#94b43b", text_color="White").grid(row=8, column=0, stick="ns")

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

        self.label_password = customtkinter.CTkLabel(master=self.frame_password, fg_color="White", bg_color="White", image = photopassword, 
                                                    height=40, width=40).grid(row=0, column=0, stick="nswe")
        self.label_password = photopassword # User label
        
        self.passwordentry = customtkinter.CTkEntry(master=self.frame_password, width=300, height=40, placeholder_text="Contraseña", fg_color="White",
                                                 corner_radius=0, border_color="White", text_color="Black")
        self.passwordentry.grid(row=0, column=1, sticky="nswe")

        # ================ Register Window (TopLevel) =================
        def popRegistro(*args):
            self.withdraw()
            vRegistro = customtkinter.CTkToplevel()
            vRegistro.geometry("1366x768")

        self.label_registro2.bind("<Button-1>", popRegistro)

if __name__ == "__main__":
    app = App()
    app.mainloop()