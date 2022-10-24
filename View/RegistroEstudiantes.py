import tkinter
import tkinter.messagebox
from turtle import width
import customtkinter
from PIL import Image, ImageTk
from matplotlib.ft2font import BOLD

class Regest (customtkinter.CTk):
    WIDTH = 1366
    HEIGHT = 768

    def __init__(self):
        super().__init__()
        self.title("Servicio de Pasantías")
        self.geometry(f"{Regest.WIDTH}x{Regest.HEIGHT}")
        self.protocol("WM_DELETE_WINDOW", self.on_closing)  #Calls .on_closing() when app gets closed

    def on_closing(self, event=0):
        self.destroy()
    
    def Launch():
        regscreen = Regest()
        regscreen.deiconify()
