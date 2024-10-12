<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use App\Models\Newsletter;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\PostNotification;

class PostController extends Controller
{
    public function index()
    {
        $categories = Category::all();

        return view('posts.index', compact('categories'));
    }
    public function show(Post $post)
    {
        return view('posts.show', compact('post'));
    }
    public function store_comment(Request $request,$postId){

        $post = Post::findOrFail($postId);
        $comment = new Comment();
        $comment->content = $request->input('comment');
        $comment->user_id = auth()->id();
        $comment->post_id = $post->id;

        $comment->save();

        return redirect()->back()->with('success', 'Yorum başarıyla eklendi!');

    }
    public function store(Request $request){
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->category_id = $request->category_id;
        $post->user_id = auth()->id();

        if ($request->hasFile('file')) {
            $imageName = time() . '.' . $request->file->extension();
            $request->file->move(public_path('post_photos'), $imageName);
            $post->image_path ='post_photos/' .  $imageName;
        }
        $post->save();
        $subscribers = Newsletter::all();
        foreach ($subscribers as $subscriber) {
            Mail::to($subscriber->email)->send(new PostNotification($post));
        }
        return redirect()->back()->with('success', 'Post başarıyla eklendi!');
    }
    public function storenewsletter(Request $request){

        $newsletter = new Newsletter();
        $newsletter->email = $request->email;
        $newsletter->save();

        return redirect()->back()->with('success', 'E-posta kaydedildi.');
    }
    public function postsByCategory($id)
    {
        $category = Category::findOrFail($id);
        $posts = Post::where('category_id', $id)->paginate(4);

        return view('category.posts', compact('category', 'posts'));
    }
}
