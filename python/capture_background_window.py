import ctypes

import win32gui
import win32ui
from PIL import Image

window_title = "FishingPlanet"

def capture_background_window(hwnd):
    left, top, right, bottom = win32gui.GetWindowRect(hwnd)
    width = right - left
    height = bottom - top

    # Create device contexts
    hwndDC = win32gui.GetWindowDC(hwnd)
    mfcDC = win32ui.CreateDCFromHandle(hwndDC)
    saveDC = mfcDC.CreateCompatibleDC()

    # Create bitmap
    saveBitMap = win32ui.CreateBitmap()
    saveBitMap.CreateCompatibleBitmap(mfcDC, width, height)

    # Select bitmap into DC
    saveDC.SelectObject(saveBitMap)

    # Use ctypes to call the correct PrintWindow function
    user32 = ctypes.windll.user32
    result = user32.PrintWindow(hwnd, saveDC.GetSafeHdc(), 2)  # 2 = PW_RENDERFULLCONTENT

    # Convert bitmap to PIL Image
    bmpinfo = saveBitMap.GetInfo()
    bmpstr = saveBitMap.GetBitmapBits(True)

    # Create PIL Image from bitmap bits
    img = Image.frombuffer(
        'RGB',
        (bmpinfo['bmWidth'], bmpinfo['bmHeight']),
        bmpstr, 'raw', 'BGRX', 0, 1
    )

    # Clean up resources
    win32gui.DeleteObject(saveBitMap.GetHandle())
    saveDC.DeleteDC()
    mfcDC.DeleteDC()
    win32gui.ReleaseDC(hwnd, hwndDC)

    return img if result == 1 else None


hwnd = win32gui.FindWindow(None, window_title)
image = capture_background_window(hwnd)
if image:
    image.save('screenshot.png')
