import tkinter
import tkinter.messagebox
from turtle import width
import customtkinter
from PIL import Image, ImageTk

class App (customtkinter.CTk):
    WIDTH = 1366
    HEIGHT = 768

    def __init__(self):
        super().__init__()
        
        self.title("Servicio de Pasantías")
        self.geometry(f"{App.WIDTH}x{App.HEIGHT}")
        self.resizable(width="False", height="False")
        self.protocol("WM_DELETE_WINDOW", self.on_closing)  #Calls .on_closing() when app gets closed

        # ================ Handle Images ================= 
        unphotoicon = Image.open('View\Images\Capybara.png')
        photoicon = ImageTk.PhotoImage(unphotoicon)
        self.iconphoto(False,photoicon)

        unphotoUN = Image.open('View\Images\Logo UN.png')
        unphotoUN = unphotoUN.resize((279,125))
        photoUN = ImageTk.PhotoImage(unphotoUN)

        unphotoback = Image.open('View\Images\Back.png')
        unphotoback = unphotoback.resize((35,35))
        photoback = ImageTk.PhotoImage(unphotoback)

        unphotoforward = Image.open('View\Images\Forward.png')
        unphotoforward = unphotoforward.resize((35,35))
        photoforward = ImageTk.PhotoImage(unphotoforward)

        # ================ Handle Main Frames ================= 

        self.frame_up = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=100, corner_radius=0, fg_color="#565a5c")
        self.frame_up.place(x = 0, y = -1)

        self.frame_down = customtkinter.CTkFrame(border_width=1, master=self, width=1366, height=669, corner_radius=0, fg_color="#94b43b")
        self.frame_down.place(x = 0, y = 99)

        # ================ Handle Widgets ================= 

        self.label_logo = customtkinter.CTkLabel(borderwidth=1,image = photoUN).place(x = 80, y = -1)
        self.label_logo = photoUN # Logo label

        self.backbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text = "", width = 40, height = 40,
                                                     image = photoback, fg_color="#565a5c", corner_radius=0).place(x = 1, y = -1)
        self.backbutton = photoback # Back Button

        self.forwardbutton = customtkinter.CTkButton(border_width=1, border_color="Black", text ="", width = 40, height = 40,
                                                     image = photoforward, fg_color="#565a5c", corner_radius=0).place(x = 41, y = -1)
        self.forwardbutton = photoforward # Forward Button

        # ================ Handle Middle Frame ================= 
        self.frame_middle = customtkinter.CTkFrame(border_width=1, master=self, width=908, height=384, corner_radius=70, fg_color="#565a5c", bg_color="#94b43b")
        self.frame_middle.place(x=229, y=250)

    def on_closing(self, event=0):
        self.destroy()

if __name__ == "__main__":
    app = App()
    app.mainloop()