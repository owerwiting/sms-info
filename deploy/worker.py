import os, time

RATE = int(os.getenv("RATE_SMS_PER_SEC", "10"))

def render_text(nls, debt):
    return f"Долг за эл.энергию {float(debt):.2f} р. Л/с {nls}. Во избежание ограничения оплатите на novgorod.tns-e.ru. Тел. 88162273396"

def send_sms(phone, text):
    # TODO: интеграция с провайдером
    return {"provider_msg_id": "DEMO"}

def loop():
    while True:
        # TODO: читать очередь и отправлять
        time.sleep(1.0 / RATE)

if __name__ == "__main__":
    loop()
