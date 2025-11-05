
char* busca(const char *s1, char c, unsigned l);
int compara(const char *s1, const char *s2, unsigned l);

int fuerza_bruta2(const char *S, const char *s, unsigned lS, unsigned ls) {
	char *res;
	for(int i = 0; i <= lS - ls + 1; i++) {
		res = busca(S + i, s[0], lS - i);
		if (compara(res,s,ls) == 1)
			return res - S;
	}
	return -1;
}