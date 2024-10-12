@extends('layouts.app')

@section('content')
    <br>
    @if(session('success'))
        <div class="alert alert-success mt-3">
            {{ session('success') }}
        </div>
    @endif
    <!-- page-header -->
    <header class="page-header"></header>
    <!-- end of page header -->

    <div class="container">
        <section>
            <div class="feature-posts">
                <a href="#" class="feature-post-item">
                    <span>Featured Categories</span>
                </a>
                @foreach($categories->take(4) as $category)
                <a href="{{ route('category.posts', $category->id) }}" class="feature-post-item">
                    <img src="{{$category->image_path}}" class="w-100" alt="">
                    <div class="feature-post-caption">{{$category->name}}</div>
                </a>
                @endforeach
            </div>
        </section>
        <hr>
        <div class="page-container">
            <div class="page-content">
                <div class="card">
                    <div class="card-header text-center">
                        <h5 class="card-title">Last Posts</h5>
                    </div>
                </div>
                <hr>
                <div class="row" id="post-container">
                    @foreach($posts as $post)
                        <div class="col-lg-6">
                            <div class="card text-center mb-5">
                                <div class="card-header p-0">
                                    <div class="blog-media">
                                        <img src="{{ asset($post->image_path) }}" alt="" class="w-100" style="height: 300px;width:85px">
                                        <a href="#" class="badge badge-primary">{{$post->category ? $post->category->name : 'Uncategorized'}}</a>
                                    </div>
                                </div>
                                <div class="card-body px-0">
                                    <h5 class="card-title mb-2">{{Str::limit($post->title, 40, '...') }}</h5>

                                    <small class="small text-muted">{{ $post->created_at->format('F j, Y') }}
                                        <span class="px-2">-</span>
                                        <a href="#" class="text-muted">{{ $post->user->name }}</a>
                                    </small>
                                </div>
                                <div class="card-footer p-0 text-center">
                                    <a href="{{ route('posts.show', $post->id) }}" class="btn btn-outline-dark btn-sm">READ MORE</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                @if($posts->hasMorePages())
                    <div class="text-center">
                        <button id="load-more" class="btn btn-primary">Load More</button>
                    </div>
                @endif
            </div>
            <!-- Sidebar -->
            <div class="page-sidebar text-center">
                <h6 class="sidebar-title mt-5 mb-4">Newsletter</h6>
                <form action="{{ route('post.storenewsletter') }}" method="POST">
                    @csrf
                    <div class="subscribe-wrapper">
                        <input type="email" name="email" class="form-control" placeholder="Email Address">
                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i></button>
                    </div>
                </form>
                <h6 class="sidebar-title mt-5 mb-4">Tags</h6>
                @foreach($categories as $category)
                    <a href="{{ route('category.posts', $category->id) }}" class="badge badge-primary m-1">#{{$category->name}}</a>
                @endforeach
            </div>
        </div>
    </div>
    <!-- Page Footer -->
    <footer class="page-footer">
        <div class="container">
            <p class="border-top mb-0 mt-4 pt-3 small">&copy; <script>document.write(new Date().getFullYear())</script>, JoeBlog Created By <a href="https://www.devcrud.com" class="text-muted font-weight-bold" target="_blank">DevCrud.</a>  All rights reserved </p>
        </div>
    </footer>
    <!-- End of Page Footer -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/dbfeb55d48.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            let page = 1; // İlk sayfa
            $('#load-more').click(function(e) {
                console.log("değiş");
                e.preventDefault(); // Varsayılan davranışı durdur
                page++; // Sayfayı artır
                $.ajax({
                    url: "{{ route('dashboard') }}?page=" + page,
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        // Postları ekle
                        if (data.data.length > 0) {
                            data.data.forEach(post => {
                                $('#post-container').append(`
                            <div class="col-lg-6">
                                <div class="card text-center mb-5">
                                    <div class="card-header p-0">
                                        <div class="blog-media">
                                            <img src="${post.image_path}" alt="" class="w-100" style="height: 300px;width:85px">
                                            <a href="#" class="badge badge-primary">${post.category ? post.category.name : 'Uncategorized'}</a>
                                        </div>
                                    </div>
                                    <div class="card-body px-0">
                                        <h5 class="card-title mb-2">${post.title}</h5>
                                        <small class="small text-muted">
                                            ${new Date(post.created_at).toLocaleDateString('en-US', {
                                    year: 'numeric',
                                    month: 'long',
                                    day: 'numeric'
                                })}
                                        <span class="px-2">-</span>
                                        <a href="#" class="text-muted">${post.user.name }</a>
                                        </small>
                                    </div>
                                    <div class="card-footer p-0 text-center">
                                        <a href="/posts/${post.id}" class="btn btn-outline-dark btn-sm">READ MORE</a>
                                    </div>
                                </div>
                            </div>
                        `);
                            });
                            // Daha fazla sayfa varsa Load More butonunu göster
                            if (!data.next_page_url) {
                                $('#load-more').hide();
                            }
                        } else {
                            $('#load-more').hide(); // Post yoksa butonu gizle
                        }
                    },
                    error: function() {
                        alert('Bir hata oluştu.');
                    }
                });
            });
        });
    </script>
@endsection
