package br.com.frajolas.pizza.app;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

public class ScrollingDetalheActivity extends AppCompatActivity {

    ImageView img;
    TextView nome, preco, descricao, ingrediente, informacao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_scrolling_detalhe);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        img = (ImageView) findViewById(R.id.img1);
        nome = (TextView) findViewById(R.id.txt_nome);
        preco = (TextView) findViewById(R.id.txt_preco);
        descricao = (TextView) findViewById(R.id.descricao);
        ingrediente = (TextView) findViewById(R.id.ingrediente);
        informacao = (TextView) findViewById(R.id.infonutri) ;


        nome.setText(MainActivity.PizzariaStatic.pizza.getNome());
       preco.setText(MainActivity.PizzariaStatic.pizza.getPreco());
        descricao.setText(MainActivity.PizzariaStatic.pizza.getDescricao());
       informacao.setText(MainActivity.PizzariaStatic.pizza.getInformacao());
        ingrediente.setText(MainActivity.PizzariaStatic.pizza.getIngrediente());


        //String retornoJson = http.get("http://10.0.2.2/inf3m/avaliacaoAPI.php");



        Picasso.with(ScrollingDetalheActivity.this)
                .load("http://10.0.2.2/inf3m/pizzariaAPI.php/" + MainActivity.PizzariaStatic.pizza.getImg())
                .into(img);



    }
    public  void conexao(){
        new AsyncTask<Void, Void, Void>() {

            String telefone;
            @Override
            protected Void doInBackground(Void... voids) {
                String retornoJson = http.get("http://10.0.2.2/inf3m/telefone.php");
                Log.d("TAG", retornoJson);

                try {
                    JSONObject tel = new JSONObject(retornoJson);
                    telefone = tel.getString("telefone");
                } catch (JSONException ex) {
                    Log.e("Erro", ex.getMessage());
                }

                return null;
            }

            @Override
            protected void onPostExecute(Void aVoid) {
                super.onPostExecute(aVoid);


                Intent intent = new Intent(Intent.ACTION_DIAL,
                        Uri.parse("tel:"+ telefone));
                startActivity(intent);

            }



        }.execute();
    }

    public void ligar(View view) {
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String url="tel:40028922";
                if (url.startsWith("tel:"))
                {
                    Intent intent = new Intent(Intent.ACTION_DIAL,
                            Uri.parse(url));
                    startActivity(intent);
                }
            }
        });
    }
}
