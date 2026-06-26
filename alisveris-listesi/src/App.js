import React, { useState } from 'react';
import './App.css';

function App() {
  const [urunler, setUrunler] = useState([]);
  const [yeniUrun, setYeniUrun] = useState('');
  const [duzenleId, setDuzenleId] = useState(null);
  const [duzenleMetin, setDuzenleMetin] = useState('');

  // EKLE
  const ekle = () => {
    if (yeniUrun.trim() === '') return;
    setUrunler([...urunler, { id: Date.now(), ad: yeniUrun, tamamlandi: false }]);
    setYeniUrun('');
  };

  // SİL
  const sil = (id) => {
    setUrunler(urunler.filter(u => u.id !== id));
  };

  // GÜNCELLE
  const guncelle = (id) => {
    setUrunler(urunler.map(u => u.id === id ? { ...u, ad: duzenleMetin } : u));
    setDuzenleId(null);
  };

  // TAMAMLANDI
  const tamamla = (id) => {
    setUrunler(urunler.map(u => u.id === id ? { ...u, tamamlandi: !u.tamamlandi } : u));
  };

  return (
    <div className="uygulama">
      <h1>🛒 Alışveriş Listesi</h1>

      <div className="ekle-alan">
        <input
          type="text"
          placeholder="Ürün ekle..."
          value={yeniUrun}
          onChange={(e) => setYeniUrun(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && ekle()}
        />
        <button onClick={ekle}>Ekle</button>
      </div>

      <ul>
        {urunler.map(urun => (
          <li key={urun.id} className={urun.tamamlandi ? 'tamamlandi' : ''}>
            {duzenleId === urun.id ? (
              <>
                <input value={duzenleMetin} onChange={(e) => setDuzenleMetin(e.target.value)} />
                <button onClick={() => guncelle(urun.id)}>Kaydet</button>
              </>
            ) : (
              <>
                <span onClick={() => tamamla(urun.id)}>{urun.ad}</span>
                <div className="butonlar">
                  <button onClick={() => { setDuzenleId(urun.id); setDuzenleMetin(urun.ad); }}>✏️</button>
                  <button onClick={() => sil(urun.id)}>🗑️</button>
                </div>
              </>
            )}
          </li>
        ))}
      </ul>

      {urunler.length === 0 && <p className="bos">Henüz ürün eklenmedi.</p>}
    </div>
  );
}

export default App;