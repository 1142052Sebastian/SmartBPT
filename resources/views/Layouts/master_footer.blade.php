@extends('layouts.master_content')
@section('footer')
    

<footer class="footer">
    <div class=" container-fluid ">
      <nav>
        <ul>
          <li>
            <a href="">
              BTR Soluotions srl
            </a>
          </li>
          <li>
            <a href="">
              About Us
            </a>
          </li>
          <li>
            <a href="">
              Blog
            </a>
          </li>
        </ul>
      </nav>
      <div class="">
        &copy; <script>
          document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
        </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
      </div>
    </div>
  </footer>

  @endsection