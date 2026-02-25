import subprocess
import time
import platform
from pynput.keyboard import Key, Controller

kb = Controller()

def windows11():
    print('Esperando Task Manager...')
    # El bucle debe estar DENTRO para refrescar la lista de procesos
    while True:
        resultado = subprocess.check_output("tasklist", shell=True, text=True)
        if "taskmgr.exe" in resultado.lower():
            print("Detectado. Maximizando...")
            time.sleep(1) # Pausa para que la ventana enfoque
            
            # Simulamos el teclado físico
            kb.press(Key.cmd)
            kb.press(Key.up)
            kb.release(Key.up)
            kb.release(Key.cmd)
            break
        time.sleep(0.5)

if platform.release() == '11':
    windows11()
