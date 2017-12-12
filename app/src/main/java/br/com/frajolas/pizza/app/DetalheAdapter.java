package br.com.frajolas.pizza.app;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by 16254841 on 29/11/2017.
 */

public class DetalheAdapter extends ArrayAdapter<Pizza> {
    public DetalheAdapter(Context context, ArrayList<Pizza> objects){
        super(context,0, objects);
    }
    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View v = convertView;

        if (v == null) {
            v = LayoutInflater.from(getContext()).inflate(R.layout.lista_main, null);
        }
        Pizza item = getItem(position);


        TextView txt_nome=(TextView) v.findViewById(R.id.txt_nome);
        TextView txt_preco=(TextView) v.findViewById(R.id.txt_preco);
        ImageView img=(ImageView) v.findViewById(R.id.img1);
        TextView descricao = (TextView) v.findViewById(R.id.descricao);
        TextView informacao = (TextView) v.findViewById(R.id.infonutri);
        TextView ingrediente = (TextView) v.findViewById(R.id.ingrediente);

        txt_nome.setText(item.getNome());
        txt_preco.setText(item.getPreco());
        descricao.setText(item.getDescricao());
        informacao.setText(item.getInformacao());
        ingrediente.setText(item.getIngrediente());

        String link ="http://10.0.2.2/inf3m/" + item.getImg();
        Log.d("link", link);

        Picasso.with(getContext())
                .load(link)
                .into(img);


        return v;
    }
}
