*** Settings ***
Library    SeleniumLibrary
Suite Setup    Abrir Navegador
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}           https://portal.cmp.ifsp.edu.br/index.php/component/content/article/57-cursos/2285-especializacao-ciencia-de-dados-editais
${BROWSER}       chrome
${LINK_TEXT_2021}    Edital 481-2020 - 1º Semestre de 2021
${LINK_TEXT_2022}    1º Semestre de 2022
${LINK_TEXT_2023}    Edital 54/2022 - 1º Semestre de 2023
${LINK_TEXT_2025}    1º Semestre de 2025

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser

*** Test Cases ***
Validar Texto do Link - 2021
    Page Should Contain Link    ${LINK_TEXT_2021}    msg=O texto do link de 2021 não foi encontrado!

Validar Texto do Link - 2022
    ${texto_do_link}    Get Text    xpath=//a[contains(@href, '2896-edital-357-2021-1-semestre-de-2022')]
    Should Contain    ${texto_do_link}    ${LINK_TEXT_2022}    msg=A parte esperada do texto de 2022 não foi encontrada!

Validar Texto do Link - 2023
    Page Should Contain Link    ${LINK_TEXT_2023}    msg=O texto do link de 2023 não foi encontrado!

Validar Texto do Link - 2025
    ${pagina_fonte}    Get Source    # Pega o código-fonte da página
    Should Contain    ${pagina_fonte}    ${LINK_TEXT_2025}    msg=O texto '1º Semestre de 2025' ainda não foi encontrado no site!
    Log To Console    Verificando se o edital de 2025 foi lançado... (Texto não encontrado ainda)