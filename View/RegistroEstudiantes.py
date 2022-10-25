import tkinter
import tkinter.messagebox
from turtle import width
import customtkinter
from PIL import Image, ImageTk
import sys
from LoginMenu import App
class Regest (customtkinter.CTk):
    WIDTH = 1366
    HEIGHT = 768

    def __init__(self):
        super().__init__()
        self.title("Servicio de Pasantías")
        self.geometry(f"{Regest.WIDTH}x{Regest.HEIGHT}")
        self.protocol("WM_DELETE_WINDOW", self.on_closing)  #Calls .on_closing() when app gets closed

        # ================ Handle Grid Weight (For Resizing) ================= 
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=0)
        self.grid_rowconfigure(1, weight=1)

        # ================ Handle Images ================= 
        unphotoicon1 = Image.open(r'View\Images\Capybara.png')
        unphotoicon1 = unphotoicon1.resize((35,35))
        photoicon1 = ImageTk.PhotoImage(unphotoicon1)
        self.iconphoto(False,photoicon1)

        unphotoUN1 = Image.open(r'View\Images\Logo UN.png')
        unphotoUN1 = unphotoUN1.resize((279,125))
        photoUN1 = ImageTk.PhotoImage(unphotoUN1)

        unphotoback1 = Image.open(r'View\Images\Back.png')
        unphotoback1 = unphotoback1.resize((35,35))
        photoback1 = ImageTk.PhotoImage(unphotoback1)

        unphotoforward1 = Image.open(r'View\Images\Forward.png')
        unphotoforward1 = unphotoforward1.resize((35,35))
        photoforward1 = ImageTk.PhotoImage(unphotoforward1)
        # ================ Handle Main Frames ================= 
        self.frame_up = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=100, corner_radius=0, fg_color="#565a5c")
        self.frame_up.grid(row=0, column=0, sticky="nswe")

        self.frame_down = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=669, corner_radius=0, fg_color="#94b43b")
        self.frame_down.grid(row=1, column=0, sticky="nswe")

        # ================ Handle Widgets ==================
        self.label_logo = customtkinter.CTkLabel(borderwidth=1,image = photoUN1).place(x = 80, y = -1)
        self.label_logo = photoUN1 # Logo label

        self.backbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text = "", width = 40, height = 40,
                                                     image = photoback1, fg_color="#565a5c", corner_radius=0).place(x = 1, y = -1)
        self.backbutton = photoback1 # Back Button

        self.forwardbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text ="", width = 40, height = 40,
                                                     image = photoforward1, fg_color="#565a5c", corner_radius=0).place(x = 41, y = -1)
        self.forwardbutton = photoforward1 # Forward Button

    def on_closing(self, event=0):
        self.destroy()
        sys.exit()
    
    def Launch():
        regscreen = Regest()
        regscreen.deiconify()
