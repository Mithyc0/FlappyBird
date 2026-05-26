# Calculadora.gd
# Este script controla toda a lógica da calculadora

extends Control

# @onready pega a referência dos nós assim que a cena carrega
@onready var input1 = $VBoxContainer/Input1
@onready var input2 = $VBoxContainer/Input2
@onready var resultado = $VBoxContainer/Resultado
@onready var info = $VBoxContainer/Info

# Cores usadas para o feedback visual
var cor_sucesso = Color(0.2, 0.8, 0.4)   # verde
var cor_erro    = Color(1.0, 0.3, 0.3)   # vermelho
var cor_normal  = Color(1.0, 1.0, 1.0)   # branco


# --------------- FUNÇÃO AUXILIAR ---------------
# Tenta pegar os números dos campos. Retorna null se der errado.
func pegar_numeros():
	var texto1 = input1.text
	var texto2 = input2.text

	# is_valid_float() checa se o texto pode virar número
	if not texto1.is_valid_float() or not texto2.is_valid_float():
		mostrar_erro("❌ Erro: insira apenas números válidos nos dois campos!")
		return null

	return [texto1.to_float(), texto2.to_float()]


# --------------- FUNÇÕES DE FEEDBACK ---------------
func mostrar_resultado(resultados: float, operacao: String):
	resultado.text = "Resultado: " + str(resultados)
	resultado.add_theme_color_override("font_color", cor_sucesso)
	info.text = "✅ Operação realizada: " + operacao
	info.add_theme_color_override("font_color", cor_sucesso)
 
func mostrar_erro(mensagem: String):
	resultado.text = "Resultado: --"
	resultado.add_theme_color_override("font_color", cor_erro)
	info.text = mensagem
	info.add_theme_color_override("font_color", cor_erro)


# --------------- SINAIS DOS BOTÕES ---------------
func _on_soma_pressed():
	var nums = pegar_numeros()
	if nums == null: return
	mostrar_resultado(nums[0] + nums[1], "Soma (+)")

func _on_subtração_pressed():
	var nums = pegar_numeros()
	if nums == null: return
	mostrar_resultado(nums[0] - nums[1], "Subtração (−)")

func _on_multiplicação_pressed():
	var nums = pegar_numeros()
	if nums == null: return
	mostrar_resultado(nums[0] * nums[1], "Multiplicação (×)")

func _on_divisão_pressed():
	var nums = pegar_numeros()
	if nums == null: return

		# Tratamento especial: divisão por zero é impossível!
	if nums[1] == 0.0:
		mostrar_erro("🚫 Erro: não existe divisão por zero!")
		return

	mostrar_resultado(nums[0] / nums[1], "Divisão (÷)")
