package util;

public class SqlBuilder {
  private String statement = "";

  public SqlBuilder() {

  }

  /* SELECT statement */
  public SqlBuilder select(String...params) {
      return command("SELECT").params(params);
  }

public SqlBuilder selectDistinct(String...params) {
      return command("SELECT DISTINCT").params(params);
  }

  public SqlBuilder from(String...tables) {
      return command("FROM").params(tables);
  }

  public SqlBuilder where(String condition) {
      return command("WHERE").enclosedParams(condition);
  }

  public SqlBuilder join(String table) {
      return command("JOIN").params(table);
  }

  public SqlBuilder as(String alias) {
      return command("AS").params(alias);
  }

  public SqlBuilder on(String condition) {
      return command("ON").enclosedParams(condition);
  }

  public SqlBuilder limit(int number) {
      return command("LIMIT").params(String.valueOf(number));
  }

  public SqlBuilder offset(int offset) {
      return command("OFFSET").params(String.valueOf(offset));
  }

  public SqlBuilder limit(int number, int offset) {
      limit(number);
      offset(offset);
      return this;
  }
  
  public SqlBuilder groupBy(String param) {
    return command("GROUP BY").params(param);
  }

  public SqlBuilder orderBy(String column) {
      return command("ORDER BY").params(column);
  }

  /* INSERT statement */
  public SqlBuilder insertInto(String table, String...columns) {
      return command("INSERT INTO").params(table).enclosedParams(columns);
  }

  public SqlBuilder values(Object...values) {
      return command("VALUES").enclosedParams(values);
  }
	
	/* UPDATE statement */
	public SqlBuilder update(String table) {
        return command("UPDATE").params(table);
    }
	
	public SqlBuilder set(String...params) {
        return command("SET").params(params);
    }
  
  /* DELETE statement */
  public SqlBuilder delete(String...params) {
    return command("DELETE").params(params);
  }

    /* Logic operators */
	public SqlBuilder not(String condition) {
		return command("NOT").enclosedParams(condition);
	}
	
	public SqlBuilder and(String condition) {
		return command("AND").enclosedParams(condition);
	}
	
	public SqlBuilder or(String condition) {
		return command("OR").enclosedParams(condition);
	}

  /* Core */
  public SqlBuilder command(String command) {
      return concat(command);
  }

  public SqlBuilder params(Object...params) {
      return concat(formatParamArray(params));
  }
	
	public SqlBuilder enclosedParams(Object...params) {
		return concat("( "+formatParamArray(params)+" )");
	}

  public String done() {
  String statementCpy = statement;
  statement = "";
      return statementCpy + ";";
  }

  @Override
  public String toString() {
    return statement; //To change body of generated methods, choose Tools | Templates.
  }

	/* Metodi utility */
  private SqlBuilder concat(String...strings) {
      for(String string : strings) {
          statement += string+" ";
      }
      return this;
  }
	
	private String formatParamArray(Object...paramArray) {
		String formatted = "";
        for(int i=0; i<paramArray.length; i++) {
            if(i == paramArray.length-1) formatted += paramArray[i] + " ";
            else formatted += paramArray[i] + ", ";
        }
		return formatted;
	}
}
