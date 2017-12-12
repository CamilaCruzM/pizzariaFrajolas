package br.com.frajolas.pizza.app;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ListView lista_main;
    MainAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        lista_main = (ListView) findViewById(R.id.lista);
        adapter = new MainAdapter(this,new ArrayList<Pizza>());
        lista_main.setAdapter(adapter);

        // dados fakes
/*
        adapter.add(Pizza.create(0,"mussarela","$40,00",""));
        adapter.add(Pizza.create(1,"calabressa","$30,00",""));
        adapter.add(Pizza.create(2,"Portuguessa","$50,00",""));
        adapter.add(Pizza.create(3,"fg","$12,00",""));




*/



        //conexao API

        lista_main.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                startActivity(new Intent(MainActivity.this,ScrollingDetalheActivity.class)) ;
                PizzariaStatic.pizza = adapter.getItem(i);

            }
        });

        new AsyncTask<Void,Void,Void>(){
            @Override
            protected Void doInBackground(Void... voids) {

                String retornoJson = http.get("http://10.0.2.2/inf3m/pizzariaAPI.php");
                Log.d("TAG",retornoJson);

                try {
                    JSONArray jsonArray = new JSONArray(retornoJson);

                    for (int i=0 ; i<jsonArray.length(); i++){
                        JSONObject item = jsonArray.getJSONObject(i);

                        adapter.add(Pizza.create(
                                item.getInt("idProduto"),
                                item.getString("nome"),
                                item.getString("preco"),
                                item.getString("imagem"),
                                item.getString("descricao"),
                                item.getString("informacaoNutri"),
                                item.getString("ingrediente")
                                ));
                    }
                } catch (Exception ex) {
                    Log.e("ERRO",ex.getMessage());
                }

                return null;
            }
        }.execute();
    }

    public static class PizzariaStatic{
        public static Pizza pizza = new Pizza();
    }
}
