package util;

public class SqlBuilder {
    private String statement = "";

    public SqlBuilder() {

    }

    /* SELECT statement */
    public SqlBuilder select(String...params) {
        return concat("SELECT", params(params));
    }

    public SqlBuilder from(String...tables) {
        return concat(command("FROM"), params(tables));
    }

    public SqlBuilder where(String condition) {
        return concat(command("WHERE"), "("+condition+")");
    }

    public SqlBuilder join(String table) {
        return concat(command("JOIN"), table);
    }

    public SqlBuilder as(String alias) {
        return concat(command("AS"), alias);
    }

    public SqlBuilder on(String condition) {
        return concat(command("ON"), condition);
    }

    public SqlBuilder limit(int number) {
        return concat(command("LIMIT"), String.valueOf(number));
    }

    public SqlBuilder offset(int offset) {
        return concat(command("OFFSET"), String.valueOf(offset));
    }

    public SqlBuilder limit(int offset, int number) {
        limit(number);
        offset(offset);
        return this;
    }

    /* INSERT statement */
    public SqlBuilder insertInto(String table, String...columns) {
        return concat(command("INSERT INTO"), table, list(columns));
    }

    public SqlBuilder values(String...values) {
        return concat(command("VALUES"), list(values));
    }
	
	/* UPDATE statement */
	public SqlBuilder update(String table) {
        return concat(command("UPDATE"), table);
    }
	
	public SqlBuilder set(String...params) {
        return concat(command("SET"), params(params));
    }

    /* Operations (sconsigliate, sono scomode da usare) */
    public String count(String...params) {
        return command("COUNT")+list(params);
    }

	public String min(String col) {
		return command("MIN")+list(col);
	}

	public String max(String col) {
		return command("MAX")+list(col);
	}

    /* Logic operators */
	public SqlBuilder not(String condition) {
		return concat(command("NOT") + "("+condition+")");
	}
	
	public SqlBuilder and(String condition) {
		return concat(command("AND") + "("+condition+")");
	}
	
	public SqlBuilder or(String condition) {
		return concat(command("OR") + "("+condition+")");
	}

    /* Core */
    public String command(String command) {
        return command;
    }

    public String params(String...params) {
        String formatted = "";
        for(int i=0; i<params.length; i++) {
            if(i == params.length-1) formatted += params[i] + " ";
            else formatted += params[i] + ", ";
        }
        return formatted;
    }

    //Come params ma con parentesi tonde davanti
    public String list(String...params) {
        return "("+params(params)+")";
    }

	// Concatena la stringa allo statement, è la base di partenza di qualsisi operazione
    public SqlBuilder concat(String...strings) {
        for(String string : strings) {
            statement += string+" ";
        }
        return this;
    }

    public String done() {
		String statementCpy = statement;
		statement = "";
        return statementCpy + ";";
    }
}
