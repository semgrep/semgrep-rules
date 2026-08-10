import logging

def get_cpf_from_db():
    return "123.456.789-00"

cpf_usuario = get_cpf_from_db()

# ruleid: lgpd-cpf-hardcoded
cpf = "123.456.789-00"

# ruleid: lgpd-cpf-hardcoded
cpf_fixo = "123.456.789-00"

# ruleid: lgpd-cpf-logged
logging.info(f"Processando CPF: {cpf_usuario}")

# ruleid: lgpd-cpf-logged
logging.debug("CPF: " + cpf_usuario)

# ruleid: lgpd-cpf-logged
print(f"CPF do usuário: {cpf_usuario}")

# ruleid: lgpd-cpf-logged
print("CPF: " + cpf_usuario)

# ok: lgpd-cpf-logged
logging.info("Processando usuário ID: %s", user_id)

# ok: lgpd-cpf-hardcoded
cpf_mascarado = "***.***.789-**"
