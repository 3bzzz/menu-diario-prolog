from flask import Flask, render_template, request
from pyswip import Prolog

app = Flask(__name__)

# Inicializar Prolog y cargar la base de conocimientos
prolog = Prolog()
prolog.consult("kb/menu.pl")

@app.route("/", methods=["GET", "POST"])
def index():
    menus = []
    min_cal = None
    max_cal = None

    if request.method == "POST":
        min_cal = int(request.form.get("min_calorias", 300))
        max_cal = int(request.form.get("max_calorias", 600))

        # Consulta al predicado generar_el_menu(Max, Min, D, Co, C, Total)
        query = f"generar_el_menu({max_cal}, {min_cal}, D, Co, C, Total)"
        try:
            resultados = list(prolog.query(query))
            for res in resultados:
                menus.append({
                    "desayuno": res["D"].replace("_", " ").title(),
                    "comida": res["Co"].replace("_", " ").title(),
                    "cena": res["C"].replace("_", " ").title(),
                    "total": res["Total"]
                })
        except Exception as e:
            print("Error al consultar Prolog:", e)

    return render_template("index.html", menus=menus, min_cal=min_cal, max_cal=max_cal)

if __name__ == "__main__":
    app.run(debug=True)