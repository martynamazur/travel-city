<img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Group%201.png" alt="Screenshot" width="50%">

## Main study goals of the project:
1) General flow of the payment process  
2) Implementing payment by BLIK code using Tpay provider (Tpay Api, sandbox) 
3) Implementing quick payment via Google Pay (Package: pay)
4) How the QR code works underneath
5) Supabase : Login/Register - by phone number → setting SMS provider (Vonage) for authentication

## Things I was trying to figure out for the first time:
1) PopScope – to show a dialog before exiting/canceling the process of buying a ticket
2) Package: flutter_windowmanager_plus – to disable screenshot and recording functions 
3) Package: screen_brightness  - to set screen brightness on TicketDetailsScreen
4) Package: qr_flutter –  QR code rendering

## Backend

1. Built a Node.js middleware server to handle communication between the mobile app and external APIs.

### Key responsibilities of the backend:
- Verifies JWT tokens issued by Supabase to authorize users.
- Stores activated tickets in a PostgreSQL database using `pg`.
- Generates custom QR tokens using `jsonwebtoken`, which include expiration metadata.
- Handles webhooks from Tpay to update transaction status in Supabase.
- Implements a Google Pay integration endpoint to initiate secure payments via Tpay API.

2.Supabase – handles user authentication and store application data


### State managment : Riverpod(v2)


## App screens :

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_144840.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_145129.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_173940.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_173924.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_173736.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250530_171813.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183713.jpg" alt="Screenshot 1" width="300" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183718.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183732.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183737.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183750.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250527_183754.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250529_142809.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250529_143818.jpg" alt="Screenshot 2" width="300" />
</div>

<div style="display: flex;">
  <img  src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250531_123228.jpg" alt="Screenshot 1" width="300" style="margin-right:10px;" />
  <img  src="https://hhvriufzsfvhjtoijfsx.supabase.co/storage/v1/object/public/appscreenshot//Screenshot_20250531_123231.jpg" alt="Screenshot 1" alt="Screenshot 2" width="300" />
</div>


