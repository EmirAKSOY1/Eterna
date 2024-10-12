<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $posts = Post::with(['category', 'user'])->paginate(2);

        if ($request->ajax()) {
            return response()->json($posts);
        }
        $categories = Category::all();
        return view('dashboard', compact('posts','categories'));
    }
}
