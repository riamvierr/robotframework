
*** Settings ***
# --- Recursos --- #
Resource    config.robot
Variables    data.yaml

# --- Bibliotecas --- #
Library     OperatingSystem
Library     BuiltIn
Library     String
Library     pabot.PabotLib
Library     Collections
Library     DateTime
Library     SeleniumLibrary

# --- Elementos de interação --- #
Resource    ../pages/login.robot
Resource    ../pages/homepage.robot

# --- Steps --- #
Resource    ../steps/login.robot

# --- Utils --- #
Resource    hooks.robot