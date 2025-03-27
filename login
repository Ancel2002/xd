mport tkinter as tk
from tkinter import messagebox
import time
import random

def fake_loading():
    loading_label.config(text="Accediendo", fg="blue")
    for i in range(5):
        loading_label.config(text=f"Accediendo{'.' * (i % 3 + 1)}")
        root.update()
        time.sleep(0.5)
    loading_label.config(text="¡Acceso permitido!", fg="green")
    messagebox.showinfo("Login Exitoso", "Bienvenido al formulario Ancelmo")

def verificar_login():
    usuario = entry_usuario.get()
    contraseña = entry_contraseña.get()
    
    if usuario == "admin" and contraseña == "1234":
        fake_loading()
    else:
        loading_label.config(text="Acceso denegado", fg="red")
        messagebox.showerror("Error", "Usuario o contraseña incorrectos")

# Configuración de la ventana
root = tk.Tk()
root.title("Login Creativo")
root.geometry("500x400")
root.configure(bg="black")

# Título
label_titulo = tk.Label(root, text="ANCEL.COM", font=("Arial", 16, "bold"), fg="red", bg="black")
label_titulo.pack(pady=10)

# Entrada de usuario
tk.Label(root, text="Usuario:", fg="white", bg="black").pack()
entry_usuario = tk.Entry(root)
entry_usuario.pack()

# Entrada de contraseña
tk.Label(root, text="Contraseña:", fg="white", bg="black").pack()
entry_contraseña = tk.Entry(root, show="*")
entry_contraseña.pack()

# Botón de login
btn_login = tk.Button(root, text="Iniciar Sesión", command=verificar_login, bg="green", fg="white")
btn_login.pack(pady=10)

# Etiqueta de carga
loading_label = tk.Label(root, text="", fg="white", bg="black")
loading_label.pack()

root.mainloop()
