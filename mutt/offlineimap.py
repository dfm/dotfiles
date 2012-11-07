#!/usr/bin/python

import keyring


def get_keychain_pass(account=None, server=None):
    return keyring.get_password(server, account)
