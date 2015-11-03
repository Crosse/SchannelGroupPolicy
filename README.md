# Group Policy Template for Schannel

I really like Nartac Software's [IIS Crypto][IISCrypto] tool for confguring protocols, ciphers, hashes and key exchange
algorithms on Windows.  However, since the tool simply makes changes to the local machine's registry it still requires
a bit of work if you want to roll out these changes to multiple machines.  Sure, you could use IIS Crypto on a single machine,
export the registry keys, then import them via a startup script GPO, but I wanted a more Group Policy-integrated way to
enable or disable things.  So I created an administrative template for Group Policy to do just that.

# Installation

From MSDN's [Managing Group Policy ADMX Files Step-by-Step Guide][admx_install], there are two ways to install
custom administrative templates.

## Local Installation
* Copy the language-neutral ADMX file(s) to `%SYSTEMROOT%\PolicyDefinitions`.
* Copy the language-specific ADML file(s) to `%SYSTEMROOT%\PolicyDefinitions\[MUIculture]`
  (for example, the U.S. English ADMX language specific file will be stored in `%SYSTEMROOT%\policyDefinitions\en-us`.)

You will then be able to use the template on your local workstation to create and edit local or domain policies, but
the template will not be available to other administrators.  A better option is to install the template files in
the domain's central store.

## Installation in the Central Store

To make the template available automatically to all Group Policy administrators in a domain, perform the following on a
domain controller:
* Copy the language-neutral ADMX file(s) to `%SYSTEMROOOT%\sysvol\domain\policies\PolicyDefinitions`.
* Copy the language-specific ADML file(s) to `%SYSTEMROOOT%\sysvol\domain\policies\PolicyDefinitions\[MUIculture]`
  (for example, the U.S. English ADMX language specific file will be stored in
  `%SYSTEMROOOT%\sysvol\domain\policies\PolicyDefinitions\en-us`.)

# Usage

The new policy settings are located in the same place one would normally configure the SSL Cipher Suite order; namely:

    Computer Configuration/Administrative Templates/Network/SSL Configuration

[IISCrypto]: https://www.nartac.com/Products/IISCrypto
[admx_install]:https://msdn.microsoft.com/en-us/library/bb530196.aspx
